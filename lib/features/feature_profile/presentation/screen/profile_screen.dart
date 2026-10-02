import 'package:firebase_app/core/extensions/snackbar_extension.dart';
import 'package:firebase_app/core/session/presentation/cubit/session_cubit.dart';
import 'package:firebase_app/core/session/presentation/cubit/user_delete_cubit.dart';
import 'package:firebase_app/core/session/presentation/state/session_state.dart';
import 'package:firebase_app/core/session/presentation/state/user_delete_state.dart';
import 'package:firebase_app/features/feature_home/presentation/screens/product/product_screen.dart';
import 'package:firebase_app/features/feature_notification/presentation/bloc/notification_cubit.dart';
import 'package:firebase_app/features/feature_notification/presentation/state/notification_state.dart';
import 'package:firebase_app/features/feature_notification/presentation/widget/header/permission_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().checkPermission();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profilim",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<SessionCubit, SessionState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<NotificationCubit, NotificationState>(
                      builder: (context, state) {
                        if (state is PermissionStatus) {
                          return PermissionHeader(
                            status: state.status,
                            notDetermined: () {},
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 10),
                    if (state is Authenticated) ...[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade200,
                        child: Text(
                          state.user.displayName?.characters.firstOrNull ?? "",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(LucideIcons.userRound),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Adınız",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      state.user.displayName ??
                                          "İsminizi henüz girmediniz",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => showUpdataNameSheet(context),
                              icon: Icon(LucideIcons.pencil),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(LucideIcons.phone),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cep numaranız",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  state.user.phoneNumber,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(LucideIcons.calendar),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kayıt tarihi",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  DateFormat(
                                    "dd.MM.yyyy HH:mm",
                                  ).format(state.user.createdAt!),
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      BlocConsumer<UserDeleteCubit, UserDeleteState>(
                        listener: (context, state) {
                          if (state is UserDeleteFailure) {
                            context.showSnackBar(message: state.message);
                          }
                          if (state is UserDeleteSuccess) {
                            context.read<SessionCubit>().signOut();
                            context.go("/home");
                            Fluttertoast.showToast(
                              msg: "Hesabınız başarılı bir şekilde silindi.",
                            );
                          }
                        },
                        builder: (context, state) {
                          final loading = state is UserDeleteLoading;

                          return OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Color(0XFFFA0351),
                              minimumSize: Size(double.infinity, 48),
                              side: BorderSide(
                                color: Color(0xFFFA0351),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: loading
                                ? null
                                : () {
                                    context
                                        .read<UserDeleteCubit>()
                                        .userDelete();
                                  },
                            label: loading
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                      strokeWidth: 1,
                                    ),
                                  )
                                : Text("Hesabımı sil"),
                            icon: loading
                                ? null
                                : Icon(Icons.delete_forever_rounded),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}