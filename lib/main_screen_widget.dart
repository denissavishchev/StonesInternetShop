import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Stones',
      home: SafeArea(
        child: Container(
          color: Colors.red,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppBar(
                title: Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    'Stones',
                    style: TextStyle(
                      fontFamily: '28days',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.deepPurple,
                  Colors.white,
                ],
              )),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 120, viewportFraction: 1, autoPlay: true),
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
                          border: Border.all(color: Colors.deepOrange.withOpacity(0.5)),
                            boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      // offset: const Offset(5, 2),
                    ),
                    ],
                        ),
                        child: buildColorIcons()),
                  ),
                  const SizedBox(height: 5,),
                  const Expanded(
                    child: ItemsWidget(),
                  ),
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

  Widget buildIconBtn(Color myColor) => Container(
    child: Stack(
      children: [
        Positioned(
          top: 6,
          left: 6,
          child: Icon(
            Icons.circle_outlined,
            size: 20,
            color: primaryColor == myColor ? Colors.deepOrangeAccent : Colors.transparent,
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
    ),
  );

}



Widget buildImage(String photos, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    color: Colors.grey,
    width: double.infinity,
    child: Image.asset(
      photos,
      fit: BoxFit.cover,
    ),
  );
}



