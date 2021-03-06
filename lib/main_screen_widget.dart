import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stones/items_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final photos = [
    'assets/images/stone01.jpeg',
    'assets/images/stone02.jpeg',
    'assets/images/stone03.jpeg',
    'assets/images/stone04.jpeg',
    'assets/images/stone05.jpeg',
    'assets/images/stone06.jpeg',
  ];

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
          Navigator.of(context).pushNamed('/add_item_screen');
        });
    }

    void back() {
      setState(() {
        Navigator.of(context).pushNamed('/auth');
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
                backgroundColor: beachTurquoise,
                title: Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      const SizedBox(width: 130,),
                       const Text(
                        'Stones',
                        style: TextStyle(
                          fontFamily: '28days',
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                            color: beachSand.withOpacity(0.5),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.only(bottom: 1),
                            onPressed: back,
                            icon: const Icon(
                              Icons.logout,
                              color: beachGreen,
                              size: 32,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 100, viewportFraction: 1, autoPlay: true),
                      itemCount: photos.length,
                      itemBuilder: (context, index, realIndex) {
                        final photo = photos[index];
                        return buildImage(photo, index);
                      },
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
                  Expanded(
                    child: ItemsWidget(),
                  ),

                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 20,),
                // FloatingActionButton(
                //     heroTag: "btn1",
                //   onPressed: () {
                //     print('Basket');
                //   },
                //   backgroundColor: beachGreen,
                //   child: const Icon(Icons.shopping_basket),
                // ),
                basket(),
                const SizedBox(width: 20,),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: add,
                  backgroundColor: beachGreen,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 20,),
              ],
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

Widget basket() => Stack(
  children: [

    FloatingActionButton(
      backgroundColor: beachGreen,
      child: const Icon(
        Icons.shopping_basket,

      ),
      onPressed:
      (){}

    ),
    Positioned(
        top: 2,
        left: 2,
        child: Container(
          alignment: Alignment.center,
          width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: beachSand,
              shape: BoxShape.circle,
            ),
            child: const Text('12'))
    ),
  ],
);

