
import 'package:flutter/material.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {

  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      setState(() {
        Navigator.of(context).pushNamed('/main_screen');
      });
    }
    else {
      setState(() {
        errorText = 'Wrong Login or Password!';
      });

    };

  }

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );

    const textFieldDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
      ),
      border: OutlineInputBorder(),

      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      isCollapsed: true,
    );

    final errorText = this.errorText;

    return MaterialApp(
      title: 'Stones and Woods',
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/surr.png'),
            fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              backgroundColor: Colors.indigo,
              title: Container(
                height: 40,
                // color: Colors.indigo,
                alignment: Alignment.center,
                child: const Text('Login or ...',
                  style: TextStyle(
                    fontFamily: '28days',
                    fontSize: 32,
                    color: Colors.white,
                  ),),
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                if (errorText !=null) Text(errorText, style: const TextStyle(color: Colors.red),),
                const SizedBox(height: 20,),
                const Text('Username:', style: textStyle,),
                TextField(
                  controller: _loginTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.deepOrange,
                ),
                const SizedBox(height: 20,),
                const Text('Password:', style: textStyle,),
                TextField(
                  controller: _passwordTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.deepOrange,
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    TextButton(
                        onPressed: _auth,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 5))
                        ),
                        child: const Text('Login')),
                    const SizedBox(width: 30,),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.deepOrange.withOpacity(0.8)),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 5))
                        ),
                        child: const Text('Register')),
                    const SizedBox(width: 30,),
                    TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Text('Reset Password')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
