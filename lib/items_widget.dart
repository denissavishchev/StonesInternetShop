import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stones/boxes.dart';
import 'package:stones/colors.dart';
import 'package:stones/models/stones.dart';



class ItemsWidget extends StatefulWidget {
   ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {

  final String stoneImage = 'assets/images/stone03.jpeg';
  final String stoneName = 'Coal';
  final String stoneColor = 'Black';
  final String stonePrice = '40';
  final String stoneLocation = 'Mars';
  final String stoneDescription = 'Sandstone is a sedimentary rock composed mainly of sand-sized minerals. '
      'Most sandstone is composed of quartz and feldspar which are the most common minerals in the Earths crust. '
      'Sandstone forms in a wide variety of colours.';

   int basket = 1;

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Stone>(HiveBoxes.stones).listenable(),
      builder: (context, Box<Stone> box, _) {
        if (box.values.isEmpty) {
          return const Center(
            child: Text('Is Empty'),
          );
        }
        return ListView.builder(
            itemCount: box.values.length,
            itemExtent: 105.5,
            itemBuilder: (BuildContext context, int index) {
              Stone? res = box.getAt(index);
              return Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10,right: 10),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: beachBlue.withOpacity(0.6)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: const Offset(-4, 2),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(image: AssetImage(res!.image))),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const SizedBox(height: 5,),
                                    Text(res.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    const SizedBox(height: 5,),
                                    Text(res.color),
                                    const SizedBox(height: 5,),
                                    Text(res.price),
                                    const SizedBox(height: 5,),
                                    Text(res.location,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 40, right: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(3, 3),
                                        color: Colors.white
                                      ),
                                    ],
                                    color: Colors.deepOrange,
                                  ),
                                  width: 60,
                                  height: 30,
                                  child: Row(
                                    children: <Widget>[
                                      Text('Sale'),
                                      Text('10%')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Material(

                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState) {
                                        return InkWell(
                                          onTap: () => Navigator.of(context).pop(true),
                                          child: AlertDialog(
                                            backgroundColor: Colors.deepOrange,
                                            scrollable: true,
                                            title: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Text(res.name),
                                                      flex: 1,),
                                                    // const SizedBox(width: 80,),
                                                    const Expanded(
                                                      flex: 1,
                                                      child:  SizedBox(
                                                        width: 70,
                                                        height: 70,
                                                        child: Image(image: AssetImage('assets/images/10off.png'),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 30,),
                                                  ],
                                                )),
                                            content: Form(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image(image: AssetImage(res.image))),
                                                  const SizedBox(height: 10,),
                                                  Text(res.color),
                                                  const SizedBox(height: 10,),
                                                  Text(res.price),
                                                  const SizedBox(height: 10,),
                                                  Text(res.location),
                                                  const SizedBox(height: 15,),
                                                  Container(
                                                      padding: const EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: beachBlue, width: 1),
                                                        borderRadius: BorderRadius.circular(5),

                                                      ),
                                                      child: Text(stoneDescription)),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: 35,
                                                height: 35,
                                                child: FloatingActionButton(
                                                  onPressed: () {
                                                    setState((){
                                                      basket--;
                                                      if (basket <= 1) {
                                                        basket = 1;
                                                      }
                                                    });
                                                  },
                                                  backgroundColor: beachGreen,
                                                  child: const Icon(Icons.remove,
                                                    size: 20,),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 20,
                                                  child: Center(child: Text(basket.toString()))),
                                              SizedBox(
                                                width: 35,
                                                height: 35,
                                                child: FloatingActionButton(
                                                  onPressed: () {
                                                    setState((){
                                                      basket++;
                                                    });
                                                  },
                                                  backgroundColor: beachGreen,
                                                  child: const Icon(Icons.add,
                                                    size: 20,),
                                                ),
                                              ),
                                              const SizedBox(width: 80,),
                                              SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: FloatingActionButton(
                                                  onPressed: () {
                                                    print('basket');
                                                  },
                                                  backgroundColor: beachGreen,
                                                  child: const Icon(Icons.shopping_basket_outlined,
                                                    size: 24,),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            // title: const Text('AlertDialog Title'),
                            // content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(onPressed: () {print('Edit');},
                                  child: const Text('Edit')),
                              const SizedBox(width: 30,),
                              TextButton(onPressed: () {
                                res.delete();
                                Navigator.of(context).pop();
                              },
                                  child: const Text('Delete')),
                              const SizedBox(width: 30,),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            });
      },

    );
  }
}

