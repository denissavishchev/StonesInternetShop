import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stones/add_button.dart';
import 'package:stones/colors.dart';
import 'package:stones/items_widget.dart';
import 'package:stones/sidebar_tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_item_widget.dart';
import 'auth_widget.dart';
import 'basket_page.dart';

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

    void basket() {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BasketScreen(initialPage: 2,)),
        );
      });
    }

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


    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('basket').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const MaterialApp(
              home: Center(
                child: CircularProgressIndicator(),
              ),
            );
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
                      color: Colors.black.withOpacity(0.1),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(6, 0, 2, 0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.2),
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                    )
                                  ]
                                ),
                                child: const Text('the best Stones from the Earth and not only...',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.fromLTRB(6, 0, 2, 0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 3,
                                      )
                                    ]
                                ),
                                child: Row(
                                  children: const [
                                    SizedBox(width: 180,),
                                    Text('Hello: ',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text('Devis', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Stack(
                            children: [
                              Positioned(
                                top: 0,
                                  left: 30,
                                  child: CircleAvatar(
                                    backgroundColor: kBlue,
                                    radius: 10,
                                      child: Text((snapshot.data?.docs.length).toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
                              CircleAvatar(
                                radius: 25,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  child: IconButton(
                                      onPressed: basket,
                                      icon: const Icon(Icons.shopping_basket_outlined, color: Colors.white,))),
                            ],
                          ),

                        ],
                      ),
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
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Image.asset('assets/images/map.png'),
                              Positioned(
                                top: 35,
                                  left: 210,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone09.png'),

                                  )),
                              Positioned(
                                  top: 100,
                                  left: 250,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone013.png'),

                                  )),
                              Positioned(
                                  top: 15,
                                  left: 110,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone012.png'),

                                  )),
                              Positioned(
                                  top: 35,
                                  left: 50,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone07.png'),

                                  )),
                              Positioned(
                                  top: 10,
                                  left: 30,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone06.png'),

                                  )),
                              Positioned(
                                  top: 75,
                                  left: 40,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone011.png'),

                                  )),
                              Positioned(
                                  top: 10,
                                  left: 180,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.withOpacity(0.6),
                                    child: Image.asset('assets/images/stone014.png'),

                                  )),

                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
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



