import 'package:flutter/material.dart';
import 'package:stones/auth_widget.dart';
import 'package:stones/boxes.dart';
import 'package:stones/main_screen_widget.dart';
import 'package:stones/add_item_widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/models/stones.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'item_page.dart';


void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(StonesAdapter());
  await Hive.openBox<Stone>(HiveBoxes.stones);
  runApp(const Stones());
}


class Stones extends StatelessWidget {
  const Stones({Key? key}) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stones',

      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/add_item_screen': (context) => AddScreenWidget(),
        '/item_page': (context) => ItemPage(),
      },
      initialRoute: '/auth',
    );
  }
}

