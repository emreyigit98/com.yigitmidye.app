import 'package:firebase_app/core/injection/injection.dart';
import 'package:firebase_app/core/navigation/app_router.dart';
import 'package:firebase_app/core/session/presentation/cubit/session_cubit.dart';
import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => servisLocarator<SessionCubit>()..userReolad(),
        ),
      ],
      child: MaterialApp.router(routerConfig: AppRouter.router),
    ),
  );
}