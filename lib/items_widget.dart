import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:stones/colors.dart';



class ItemsWidget extends StatefulWidget {
   ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {

  final String stoneImage = 'assets/images/stone03.jpeg';
  final String stoneName = 'Coal';
  final String stoneColor = 'Black';
  final double stonePrice = 40;
  final String stoneLocation = 'Mars';
  final String stoneDescription = 'Sandstone is a sedimentary rock composed mainly of sand-sized minerals. '
      'Most sandstone is composed of quartz and feldspar which are the most common minerals in the Earths crust. '
      'Sandstone forms in a wide variety of colours.';

   int basket = 1;

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  @override

  Widget build(BuildContext context) {
    // final itemsCount = ItemsWidgetModelProvider.watch(context)?.model.items.length ?? 0;
    return ListView.builder(
        itemCount: 10,
        itemExtent: 105.5,
        itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10,right: 10),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                              child: Image(image: AssetImage(stoneImage))),
                          const SizedBox(width: 5,),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const SizedBox(height: 5,),
                                  Text('Name: $stoneName',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                                  const SizedBox(height: 5,),
                                  Text('Color: $stoneColor'),
                                  const SizedBox(height: 5,),
                                  Text('Price: $stonePrice Euro'),
                                  const SizedBox(height: 5,),
                                  Text('Location: $stoneLocation',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                          ),

                        ],
                      ),
                    ),
                ),
                Expanded(
                  flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                return AlertDialog(
                                  scrollable: true,
                                  title: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                              child: Text(stoneName),
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
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: FloatingActionButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                backgroundColor: beachGreen.withOpacity(0.5),
                                                child: const Icon(Icons.close,
                                                  size: 24,),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  content: Form(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: AssetImage(stoneImage))),
                                        const SizedBox(height: 10,),
                                        Text('Color: $stoneColor'),
                                        const SizedBox(height: 10,),
                                        Text('Price: $stonePrice Euro'),
                                        const SizedBox(height: 10,),
                                        Text('Location: $stoneLocation'),
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
                         TextButton(onPressed: () {print('Delete');},
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
  }
}

