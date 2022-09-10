import 'package:flutter/material.dart';
import 'package:stones/boxes.dart';
import 'package:stones/colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/models/stones.dart';


class AddScreenWidget extends StatefulWidget {
  const AddScreenWidget({Key? key}) : super(key: key);



  @override
  State<AddScreenWidget> createState() => AddScreenWidgetState();
}

class AddScreenWidgetState extends State<AddScreenWidget> {


  @override
  Widget build(BuildContext context) {

    final _imageTextController = TextEditingController();
    final _nameTextController = TextEditingController();
    final _colorTextController = TextEditingController();
    final _priceTextController = TextEditingController();
    final _locationTextController = TextEditingController();

    late String stoneImage;
    late String stoneName;
    late String stoneColor;
    late String stonePrice;
    late String stoneLocation;

    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );

    const textFieldDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: beachBlue, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: beachBlue, width: 2),
      ),
      border: OutlineInputBorder(),

      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      isCollapsed: true,
    );

    void back() {
      // setState(() {
      Navigator.of(context).pushNamed('/main_screen');
      // });
    }

    void _onFormSubmit() {
      Box<Stone> stonesBox = Hive.box<Stone>(HiveBoxes.stones);
      stonesBox.add(Stone(image: stoneImage,
                            name: stoneName,
                            color: stoneColor,
                            price: stonePrice,
                            location: stoneLocation));
      Navigator.of(context).pushNamed('/main_screen');

      print(stonesBox);

    }

    return MaterialApp(
      title: 'Stones',
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              backgroundColor: Colors.indigo,
              title: Container(
                height: 40,
                // color: Colors.indigo,
                alignment: Alignment.center,
                child: const Text('Add...',
                  style: TextStyle(
                    fontFamily: '28days',
                    fontSize: 32,
                    color: Colors.white,
                  ),),
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 220),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: beachBlue.withOpacity(0.7)),
              boxShadow: [
                BoxShadow(
                  color: beachSand.withOpacity(0.4),
                  // blurRadius: 8,
                  // offset: const Offset(-5, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(height: 10),
                TextButton(
                    onPressed: back,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(beachGreen),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 5))
                    ),
                    child: const Text('Back')),
                const SizedBox(height: 10),
                const Text('Image:', style: textStyle,),
                TextField(
                  controller: _imageTextController,
                  decoration: textFieldDecoration.copyWith(hintText: '1-6'),
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) {
                    stoneImage = 'assets/images/stone0' + value + '.png';
                  },
                ),
                const SizedBox(height: 20),
                const Text('Name:', style: textStyle,),
                TextField(
                  controller: _nameTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) {
                    stoneName = value;
                  },
                ),
                const SizedBox(height: 20,),
                const Text('Color:', style: textStyle,),
                TextField(
                  controller: _colorTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) {
                    stoneColor = value;
                  },
                ),
                const SizedBox(height: 20,),
                const Text('Price:', style: textStyle,),
                TextField(
                  controller: _priceTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) {
                    stonePrice = value;
                  },
                ),
                const SizedBox(height: 20,),
                const Text('Location:', style: textStyle,),
                TextField(
                  controller: _locationTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) {
                    stoneLocation = value;
                  },
                ),
                const SizedBox(height: 20,),
                TextButton(
                    onPressed: () {
                      _onFormSubmit();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(beachGreen),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 5))
                    ),
                    child: const Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

