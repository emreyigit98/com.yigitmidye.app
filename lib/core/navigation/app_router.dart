import 'package:firebase_app/core/injection/injection.dart';
import 'package:firebase_app/core/session/presentation/cubit/session_cubit.dart';
import 'package:firebase_app/core/session/presentation/state/session_state.dart';
import 'package:firebase_app/features/feature_adress/presentation/bloc/adress_bloc.dart';
import 'package:firebase_app/features/feature_adress/presentation/event/adress_event.dart';
import 'package:firebase_app/features/feature_adress/presentation/screens/adress_screen.dart';
import 'package:firebase_app/features/feature_adress/presentation/screens/save_adress_screen.dart';
import 'package:firebase_app/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_app/features/feature_auth/presentation/screens/input_otp_screen.dart';
import 'package:firebase_app/features/feature_auth/presentation/screens/input_phone_screen.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_bloc.dart';
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_count_cubit.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/screens/cart_adress_screen.dart';
import 'package:firebase_app/features/feature_cart/presentation/screens/cart_screen.dart';
import 'package:firebase_app/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:firebase_app/features/feature_home/presentation/event/home_event.dart';
import 'package:firebase_app/features/feature_home/presentation/screens/product/product_screen.dart';
import 'package:firebase_app/features/feature_splash/presentation/screens/splash_screen.dart';
import 'package:flutter/rendering.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    servisLocarator<CartCountCubit>()..cartCount(),
              ),
              BlocProvider(
                create: (context) =>
                    servisLocarator<HomeBloc>()..add(GetHomeDataEvent()),
              ),
            ],
            child: BlocListener<SessionCubit, SessionState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  debugPrint("giriş başarılı");
                  context.read<CartCountCubit>().cartCount();
                }
                if (state is Unauthenticated) {
                  debugPrint("çıkış başarılı");
                  context.read<CartCountCubit>().reset();
                }
              },
              child: ProductScreen(),
            ),
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) =>
                servisLocarator<CartBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(path: "/cart", builder: (context, state) => CartScreen()),
          GoRoute(path: "/get-adress",builder: (context, state) => CartAdressScreen())
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => servisLocarator<AdressBloc>()..add(GetAdressEvent()),
            child: child,
          );
        },
        routes: [
          GoRoute(path: "/adress", builder: (context, state) => AdressScreen()),
          GoRoute(
            path: "/save-adress",
            builder: (context, state) => SaveAdressScreen(),
          ),
        ],
      ),
    ],
  );
}