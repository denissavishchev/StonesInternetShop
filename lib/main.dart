import 'package:flutter/material.dart';
import 'package:stones/auth_widget.dart';
import 'package:stones/main_screen_widget.dart';
import 'package:stones/add_item_widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const Stones());
}

class Stones extends StatelessWidget {
  const Stones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stones',

      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/add_item_screen': (context) => AddScreenWidget(),
      },
      initialRoute: '/auth',
    );
  }
}

