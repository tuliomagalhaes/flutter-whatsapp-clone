import 'package:flutter/material.dart';
import 'package:whatsup/features/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'WhatsUp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: new Color(0xff075E54),
                accentColor: new Color(0xff25D366),
            ),
            home: HomePage(),
        );
    }
}