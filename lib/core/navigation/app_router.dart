import 'package:firebase_app/core/injection/injection.dart';
import 'package:firebase_app/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_app/features/feature_auth/presentation/screens/input_otp_screen.dart';
import 'package:firebase_app/features/feature_auth/presentation/screens/input_phone_screen.dart';
import 'package:firebase_app/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:firebase_app/features/feature_home/presentation/event/home_event.dart';
import 'package:firebase_app/features/feature_home/presentation/screens/product/product_screen.dart';
import 'package:firebase_app/features/feature_splash/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(path: "/splash", builder: (context, state) => SplashScreen()),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => servisLocarator<AuthBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/input-phone",
            builder: (context, state) => InputPhoneScreen(),
          ),
          GoRoute(
            path: "/input-otp",
            builder: (context, state) => InputOtpScreen(),
          ),
        ],
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                servisLocarator<HomeBloc>()..add(GetHomeDataEvent()),
            child: ProductScreen(),
          );
        },
      ),
    ],
  );
}