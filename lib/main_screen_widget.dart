import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/add_button.dart';
import 'package:stones/colors.dart';
import 'package:stones/items_widget.dart';
import 'package:stones/sidebar_tiles.dart';

import 'add_item_widget.dart';
import 'auth_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  static List mycolors = <Color>[
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.yellowAccent,
  ];
  Color primaryColor = mycolors[0];

  @override
  Widget build(BuildContext context) {

    void add() {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddScreenWidget()),
          );
        });
    }

    void back() {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AuthWidget()),
        );
      });
    }


    return MaterialApp(
      title: 'Stones',
      home: SafeArea(
        child: Container(
          color: Colors.red,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppBar(
                backgroundColor: Colors.black,
                title: Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(width: 60,),
                       const Text(
                        'Stones',
                        style: TextStyle(
                          fontFamily: 'Combo',
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 50,),
                      AddButton(title: 'Add', onPressed: add)
                    ],
                  ),
                ),
              ),
            ),
            drawer: Drawer(
              width: 150,
              backgroundColor: beachGreen.withOpacity(0.5),
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        beachTurquoise,
                        beachGreen
                      ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(70),),
                        elevation: 15,
                        child: Image.asset('assets/images/stone05.png')),),
                  SidebarTile(icon: Icons.person, text: 'Profile', onTap: (){}),
                  SidebarTile(icon: Icons.favorite, text: 'Favourites', onTap: (){}),
                  SidebarTile(icon: Icons.bug_report_outlined, text: 'Bugs', onTap: (){}),
                  SidebarTile(icon: Icons.logout, text: 'Log Out', onTap: back),
                ],
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_main.png'),
                    fit: BoxFit.cover),),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: beachBlue.withOpacity(0.5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(-5, 2),
                            ),
                          ],
                        ),
                        child: buildColorIcons()),
                  ),

                  const SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 480,
                    color: Colors.transparent,
                    child: ItemsWidget(),
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColorIcons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [for (var i = 0; i < 8; i++) buildIconBtn(mycolors[i])],
  );

  Widget buildIconBtn(Color myColor) => Stack(
    children: [
      Positioned(
        top: 6,
        left: 6,
        child: Icon(
          Icons.circle_outlined,
          size: 20,
          color: primaryColor == myColor ? beachGreen : Colors.transparent,
        ),
      ),
      SizedBox(
        height: 30,
        width: 30,
        child: IconButton(
          icon: Icon(
            Icons.circle,
            color: myColor.withOpacity(0.65),
            size: 16,
          ),
          onPressed: () {
            setState(() {
              if( primaryColor == myColor) {
                primaryColor = myColor.withOpacity(0.0);
              }
              else {
                primaryColor = myColor;
              }
            });
          },
        ),
      ),
    ],
  );

}



Widget buildImage(String photos, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1),
    color: Colors.grey,
    width: double.infinity,
    child: Image.asset(
      photos,
      fit: BoxFit.cover,
    ),
  );
}



