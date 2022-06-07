import 'package:api_provider/home_page.dart';
import 'package:api_provider/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) {
            return Provides();
          }),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
