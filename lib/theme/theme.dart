import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white24,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      )),
  useMaterial3: true,
);
