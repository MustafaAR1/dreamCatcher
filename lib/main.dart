import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Auth/cubit/auth_cubit.dart';
import 'package:myapp/community/cubit/community_cubit.dart';
import 'package:myapp/onboarding/cubit/onboarding_cubit.dart';
import 'package:myapp/Auth/cubit/screens/phone_screen.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 182, 182, 182)),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) {
            return AuthCubit();
          },
          child: BlocProvider(
              create: (context) {
                return OnboardingCubit();
              },
              child: BlocProvider(
                create: (context) => CommunityCubit(),
                child: const PhoneAuthScreen(),
              )),
        ));
  }
}
