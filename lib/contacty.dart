import 'package:contacty/router.dart';
import 'package:flutter/material.dart';

class ContactyApp extends StatelessWidget {
  const ContactyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Contacty",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
