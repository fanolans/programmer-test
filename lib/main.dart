import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_kominfo/bloc/login/login_bloc.dart';
import 'package:flutter_test_kominfo/bloc/logout/logout_bloc.dart';
import 'package:flutter_test_kominfo/bloc/register/register_bloc.dart';
import 'package:flutter_test_kominfo/data/services/auth_local_service.dart';
import 'package:flutter_test_kominfo/pages/auth/auth_page.dart';
import 'package:flutter_test_kominfo/pages/home/home_page.dart';
import 'package:flutter_test_kominfo/utils/light_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: light,
        home: FutureBuilder<bool>(
          future: AuthLocalService().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
