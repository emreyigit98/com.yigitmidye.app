import 'package:firebase_app/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_app/features/feature_auth/presentation/event/auth_event.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_state.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_status.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/banner/input_phone_banner.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/button/auth_button.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/icon/auth_icon.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/layout/auth_layout.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/spacing/auth_spacing.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text/auth_title.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text_field/input_phone_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InputPhoneScreen extends StatefulWidget {
  const InputPhoneScreen({super.key});

  @override
  State<InputPhoneScreen> createState() => _InputPhoneScreenState();
}

class _InputPhoneScreenState extends State<InputPhoneScreen> {
  final phoneController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      listener: (context, state) {

        final authStatus = state.authStatus;

        if (authStatus is SendCodeSuccessful) {
          context.push("/input-otp");
        }

        if (authStatus is SendCodeError) {
          final message = state.authStatus as SendCodeError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message.message)));
        }
      },
      builder: (context, state) {
        final loading = state.authStatus is SendCodeLoading;

        return AuthLayout(
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                textStyle: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.go("/home");
              },
              child: Text("Atla"),
            ),
            const SizedBox(width: 16),
          ],
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthIcon(),
                AuthSpacing(),
                AuthTitle(
                  title: "Cep numaran nedir?",
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                AuthSpacing(),
                AuthTitle(
                  title: "Devam etmek için cep numaranızı girin",
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                AuthSpacing(),
                InputPhoneTextfield(
                  phoneController: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "telefon giriş alanı boş bırakılamaz";
                    }
                    if (value.length < 10) {
                      return "telefon numarası 10 haneden küçük olamaz";
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
                            final phone = "+90${phoneController.text}";
                            context.read<AuthBloc>().add(SendCodeEvent(phone));
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
                      : Text("Devam et"),
                ),
                AuthSpacing(),
                InputPhoneBanner(),
              ],
            ),
          ),
        );
      },
    );
  }
}