import 'package:firebase_app/core/entity/payment_entity.dart';

class Constants {
  static final String categories = "Categories";
  static final String products = "Products";
  static final String users = "Users";
  static final String cart = "Cart";
  static final String adress = "Adress";

  static final String apiKey = "AIzaSyD4cZfWBnG02bdykGju3h6DPE6vtOF_XFQ";

  static final List<String> neigh = [
    "100. Yıl Mahallesi",
    "17 Eylül Mahallesi",
    "600 Evler Mahallesi",
    "Ayyıldız  Mahallesi",
    "Bentbaşı Mahallesi",
    "Çınarlı Mahallesi",
    "Dere Mahallesi",
    "Günaydın Mahallesi",
    "Hacıyusuf Mahallesi",
    "Haydar Çavuş Mahallesi",
    "İhsaniye Mahallesi",
    "Kayacık Mahallesi",
    "Levent Mahallesi",
    "Paşabayır Mahallesi",
    "Paşakent Mahallesi",
    "Paşakonak Mahallesi",
    "Paşamescit Mahallesi",
    "Sunullah Mahallesi",
    "Yeni Mahalle",
  ];

  static final List<String> notes = [
    "Zile basmayın",
    "Gelince arayın",
    "Mümkün olduğunca erken"
  ];

  static final List<PaymentEntity> payments = [
    PaymentEntity(
      icon: "assets/images/cash.png",
      paymentType: "Kapıda Nakit",
      title: "Siparişini nakit olarak öde",
    ),
    PaymentEntity(
      icon: "assets/images/credit_card.png",
      paymentType: "Kapıda Kredi kartı",
      title: "Siparişini kredi kartı ile öde",
    )
  ];
}
