
import 'package:flutter/material.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}



class _AuthWidgetState extends State<AuthWidget> {

  void _auth() {
    setState(() {
      Navigator.of(context).pushNamed('/main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stones and Woods',
      home: Container(
        child: Container(
          color: Colors.red,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Container(
                height: 60,
                alignment: Alignment.center,
                child: const Text('Auth',
                  style: TextStyle(
                    fontFamily: '28days',
                    fontSize: 40,
                    color: Colors.white,
                  ),),
              ),
            ),
            body: Container(
              color: Colors.white,
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: _auth,
                child: Text('Login'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
