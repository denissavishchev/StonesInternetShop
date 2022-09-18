import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stones/colors.dart';
import 'package:stones/item_page.dart';


class ItemsWidget extends StatefulWidget {
   ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {


  static String stoneIm = '';
  static String stoneNa = '';
  static String stonePr = '';




  void toItem (String stoneImage, String stoneName, String stonePrice) {
    setState(() {
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemPage()),
          );
      stoneIm = stoneImage;
      stoneNa = stoneName;
      stonePr = stonePrice;
    });
  }


  @override

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('stones').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('No data');
        return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemExtent: 120,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10,right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.withOpacity(0.6)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(-4, 2),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //   width: 150,
                                //   height: 200,
                                //   color: Colors.white,
                                //   child: ClipRRect(
                                //       borderRadius: BorderRadius.circular(10),
                                //       child: Image(image: AssetImage(res!.image))),
                                // ),
                                const SizedBox(width: 120,),
                                Container(
                                  width: 150,
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      const SizedBox(height: 5,),
                                      Text(snapshot.data?.docs[index].get('name'),
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Combo', color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('Color: ', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7))),
                                          Text(snapshot.data?.docs[index].get('color'), style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),

                                      Row(
                                        children: [
                                          Text('From: ', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7))),
                                          Text(snapshot.data?.docs[index].get('location'),
                                            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 5,),
                                      Container(
                                        width: 60,
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(20)),
                                            border: Border.all(width: 1, color: Colors.grey),
                                            color: Colors.white.withOpacity(0.2),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.8),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                              )
                                            ]
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('\$ ', style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.7))),
                                            Text(snapshot.data?.docs[index].get('price'), style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5,),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.transparent,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(image: AssetImage(snapshot.data?.docs[index].get('image')))),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      toItem(
                          snapshot.data?.docs[index].get('image'),
                          snapshot.data?.docs[index].get('name'),
                          snapshot.data?.docs[index].get('price'),
                      );

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ItemPage()),
                      // );
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
                              FirebaseFirestore.instance.collection('stones').doc(snapshot.data?.docs[index].id).delete();
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
              );
            });
        });
  }
}

