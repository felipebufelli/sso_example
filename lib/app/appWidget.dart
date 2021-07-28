import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sso_example/app/features/autentication/controller/autentication_controller.dart';
import 'package:sso_example/app/features/autentication/view/autentication_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AutenticationController(),
      lazy: false,
      child: MaterialApp(
        title: 'Autetication With SSO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AutenticationPage(),
      ),
    );
  }
}
