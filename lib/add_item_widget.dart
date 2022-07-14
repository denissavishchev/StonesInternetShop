import 'package:flutter/material.dart';
import 'package:stones/items/items_widget_model.dart';
import 'package:stones/items_widget.dart';
import 'package:stones/colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/add_item_widget_model.dart';


class AddScreenWidget extends StatefulWidget {
  const AddScreenWidget({Key? key}) : super(key: key);

  @override
  State<AddScreenWidget> createState() => _AddScreenWidgetState();
}

class _AddScreenWidgetState extends State<AddScreenWidget> {
  final _model = AddItemWidgetModel();

  @override
  Widget build(BuildContext context) {
    return AddItemWidgetModelProvider(
        model: _model,
        child: const _AddScreenWidgetBody());
  }
}

// Future addItems(String stoneImage, String stoneColor, double stonePrice, String stoneLocation ) async {
//   final transaction = Items()
//     ..stoneImage = stoneImage
//     ..stoneColor = stoneColor
//     ..stonePrice = stonePrice
//     ..stoneLocation = stoneLocation
//     ..createdDate = DateTime.now();
//
//   final box = Boxes.getItems();
//   box.add(transaction);
//   print('object');
//   print(box);
//
// }

class _AddScreenWidgetBody extends StatefulWidget {
  const _AddScreenWidgetBody({Key? key}) : super(key: key);

  @override
  State<_AddScreenWidgetBody> createState() => _AddScreenWidgetBodyState();
}

class _AddScreenWidgetBodyState extends State<_AddScreenWidgetBody> {
  final _model = ItemsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return ItemsWidgetModelProvider(
      model: _model,
        child: const _ItemsWidgetBody());
  }
}

class _ItemsWidgetBody extends StatelessWidget {
  const _ItemsWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AddItemWidgetModelProvider.read(context)?.model;

    final _imageTextController = TextEditingController();
    final _nameTextController = TextEditingController();
    final _colorTextController = TextEditingController();
    final _priceTextController = TextEditingController();
    final _locationTextController = TextEditingController();

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


    // void addItems(String stoneImage, String stoneColor, double stonePrice, String stoneLocation ) async {
    //   final transaction = Items()
    //     ..stoneImage = stoneImage
    //     ..stoneColor = stoneColor
    //     ..stonePrice = stonePrice
    //     ..stoneLocation = stoneLocation
    //     ..createdDate = DateTime.now();
    //
    //   final box = Boxes.getItems();
    //   box.add(transaction);
    //   print('object');
    //   print(box);
    // }



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
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) => model?.imageStone = value,
                  onEditingComplete: () => model?.addStone(context),
                ),
                const SizedBox(height: 20),
                const Text('Name:', style: textStyle,),
                TextField(
                  controller: _nameTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) => model?.nameStone = value,
                  onEditingComplete: () => model?.addStone(context),
                ),
                const SizedBox(height: 20,),
                const Text('Color:', style: textStyle,),
                TextField(
                  controller: _colorTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) => model?.colorStone = value,
                  onEditingComplete: () => model?.addStone(context),
                ),
                const SizedBox(height: 20,),
                const Text('Price:', style: textStyle,),
                TextField(
                  controller: _priceTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) => model?.priceStone = value,
                  onEditingComplete: () => model?.addStone(context),
                ),
                const SizedBox(height: 20,),
                const Text('Location:', style: textStyle,),
                TextField(
                  controller: _locationTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: beachBlue,
                  onChanged: (value) => model?.locationStone = value,
                  onEditingComplete: () => model?.addStone(context),
                ),
                const SizedBox(height: 20,),
                TextButton(
                    onPressed: () => ItemsWidgetModelProvider.read(context)?.model.add(context),
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