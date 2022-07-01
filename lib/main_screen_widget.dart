import 'package:flutter/material.dart';
import 'package:stones/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.indigo,
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
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Stones',
                  style: TextStyle(
                    fontFamily: '28days',
                    fontSize: 40,
                    color: Colors.white,
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
                  Colors.lightGreenAccent,
                  Colors.white,
                ],
              )),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                  buildColorIcons(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Text!',
                      style: TextStyle(
                        fontFamily: '28days',
                        fontSize: 80,
                        color: Colors.red,
                      ),
                    ),
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
    children: [for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])],
  );

  Widget buildIconBtn(Color myColor) => Container(
    child: Stack(
      children: [
        Positioned(
          top: 14,
          left: 14,
          child: Icon(
            Icons.circle,
            size: 20,
            color: primaryColor == myColor ? Colors.black : Colors.transparent,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.circle,
            color: myColor.withOpacity(0.65),
            size: 30,
          ),
          onPressed: () {
            setState(() {
              primaryColor = myColor;
            });
          },
        ),
      ],
    ),
  );

}



Widget buildImage(String photos, int index) {
  return ClipRRect(
    // borderRadius: BorderRadius.circular(20),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey,
      width: double.infinity,
      child: Image.asset(
        photos,
        fit: BoxFit.cover,
      ),
    ),
  );
}



