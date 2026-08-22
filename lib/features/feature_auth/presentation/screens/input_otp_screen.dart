import 'package:firebase_app/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_app/features/feature_auth/presentation/event/auth_event.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_state.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_status.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/button/auth_button.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/icon/auth_icon.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/layout/auth_layout.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/spacing/auth_spacing.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text/auth_title.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text_field/input_otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class InputOtpScreen extends StatefulWidget {
  const InputOtpScreen({super.key});

  @override
  State<InputOtpScreen> createState() => _InputOtpScreenState();
}

class _InputOtpScreenState extends State<InputOtpScreen> {
  final otpController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      listener: (context, state) {

        if (state.authStatus is VerifyCodeError) {

          final message = state.authStatus as VerifyCodeError;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message.message,
                style: TextStyle(color: Colors.black, fontFamily: "Inter"),
              ),
            ),
          );
        }

        if (state.authStatus is VerifyCodeSuccessful) {
          final user = state.authStatus as VerifyCodeSuccessful;
          Fluttertoast.showToast(
            msg:
                "${user.userModel.phoneNumber} numaralı telefon ile başarılı bir şekilde giriş yaptınız.",
            toastLength: Toast.LENGTH_LONG,
          );
          context.go("/home");
        }

        if (state.authStatus is ResendCodeSuccessful) {
          Fluttertoast.showToast(
            msg: "Sms kodunuz tekrar ${state.phoneNumber} gönderilmiştir.",
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      builder: (context, state) {
        final loading = state.authStatus is SendCodeLoading;
        final resendLoading = state.authStatus is ResendCodeLoading;

        return AuthLayout(
          actions: null,
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthIcon(),
                AuthSpacing(),
                AuthTitle(
                  title: "Giriş bilgilerini doğrulamamıza yardımcı olun",
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                AuthSpacing(),
                AuthTitle(
                  title:
                      "${state.phoneNumber} için bir doğrulama kodu gönderdik",
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                AuthSpacing(),
                AuthTitle(
                  title: "lütfen kodu aşşağıya girin",
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                AuthSpacing(),
                InputOtpTextfield(
                  otpController: otpController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "kod girme alanı boş bırakılamaz";
                    }
                    if (value.length < 6) {
                      return "sms kodu 6 haneden küçük olamaz";
                    }
                    return null;
                  },
                ),
                AuthSpacing(),
                AuthButton(
                  onPressed: loading
                      ? null
                      : () {
                          if (key.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              VerifyCodeEvent(otpController.text),
                            );
                          }
                        },
                  child: loading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.white,
                          ),
                        )
                      : Text("Giriş yap"),
                ),
                AuthSpacing(),
                !state.isResend
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Tekrar deneyebilmek için kalan süre:${state.resendSecond}",
                              ),
                            ),
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(ResendCodeEvent());
                        },
                        child: Text("Tekrar gönder"),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}