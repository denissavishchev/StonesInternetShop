import 'package:flutter/material.dart';
import 'package:stones/auth_widget.dart';
import 'package:stones/main_screen_widget.dart';

void main() {
  runApp(Stones());
}

class Stones extends StatelessWidget {
  const Stones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stones',

      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth',

      home: SafeArea(
        child: Container(
          color: Colors.red,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Stones and Woods',
                style: TextStyle(
                  fontFamily: '28days',
                  fontSize: 40,
                  color: Colors.white,
                ),),
            ),
          ),
        ),
      ),
    );
  }
}

