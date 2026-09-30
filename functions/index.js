
const { onDocumentCreated, onDocumentUpdated } = require("firebase-functions/v2/firestore");
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const { getMessaging } = require("firebase-admin/messaging");


initializeApp();

const database = getFirestore();

exports.deleteCartItems = onDocumentCreated("Orders/{orderId}", async (event) => {

    const data = event.data?.data();
    const userId = data.user_id;
    try {
        const cartReferans = database.collection("Users").doc(userId).collection("Cart");
        const snapshot = await cartReferans.get();
        const batch = database.batch();

        snapshot.docs.forEach((doc) => {
            batch.delete(doc.ref);
        });

        await batch.commit();

    } catch (error) {
        throw error;
    }
});

exports.pushNotificationAdmin = onDocumentCreated("Orders/{orderId}", async (event) => {

    const data = event.data?.data();

    try {
        const userName = data.adress.name;
        const id = data.order_id;
        const token = await database.collection("Admin").doc("token").get();

        const adminTokenData = token.data();
        const adminToken = adminTokenData.fcm_token;

        const payload = {
            token: adminToken,
            notification: {
                title: `Yeni Sipariş Bildirimi`,
                body: `${userName} adlı kullanıcıdan yeni sipariş aldınız.Sipariş no:#${id}`
            },
            android: {
                priority: "high",
                notification: {
                    channelId: "default_channel",
                    sound: "notification_sound",
                    icon: "logo_svg_1",
                },
            },
            apns: {
                payload: {
                    aps: {
                        sound: "default",
                    },
                },
            }
        };

        const sendNotification = getMessaging().send(payload);
        await sendNotification;

    } catch (e) {
        throw e;
    }
});

exports.updateOrderStatus = onDocumentUpdated("Orders/{orderId}", async (event) => {

    const beforeData = event.data.before.data();
    const afterData = event.data.after.data();

    if (beforeData.order_status === afterData.order_status) {
        return null;
    }

    const userId = afterData.user_id;

    const userSnapshot = await database
        .collection("Users")
        .doc(userId)
        .get();

    const fcmToken = userSnapshot.data()?.fcm_token;

    const payload = {
        token: fcmToken,

        notification: {
            title: "Sipariş Durumu Güncellendi",
            body: afterData.order_status,
        },

        android: {
            priority: "high",
            notification: {
                channelId: "orders_notification",
            },
        },

        apns: {
            payload: {
                aps: {
                    sound: "default",
                },
            },
        },
    };

    try {
        await getMessaging().send(payload);

    } catch (error) {
          console.error("Bildirim gönderilemedi:", error);
    }
    return null;
});