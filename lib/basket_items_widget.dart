import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stones/colors.dart';


class BasketItemsWidget extends StatefulWidget {
  BasketItemsWidget({Key? key}) : super(key: key);

  @override
  State<BasketItemsWidget> createState() => BasketItemsWidgetState();
}

class BasketItemsWidgetState extends State<BasketItemsWidget> {



  @override

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('basket').snapshots(),
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 120,),
                                      Text(snapshot.data?.docs[index].get('name'),
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, fontFamily: 'Combo', color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,),
                                      const SizedBox(width: 10,),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        child: Column(
                                          children: const [
                                            SizedBox(height: 5,),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 30,
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
                                                Text(snapshot.data?.docs[index].get('price'), style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance.collection('basket').doc(snapshot.data?.docs[index].id).delete();
                                            },
                                            icon: const Icon(Icons.dangerous_outlined), color: Colors.deepOrange,),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 110),
                                    color: Colors.transparent,
                                    width: 200,
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              child: Image.asset('assets/images/life.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              '95%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              child: Image.asset('assets/images/wisdom.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              '10%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              child: Image.asset('assets/images/energy.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              '47%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              child:
                                              Image.asset('assets/images/charisma.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              '81%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              child: Image.asset('assets/images/death.png'),
                                              width: 20,
                                              height: 20,
                                            ),
                                            const Text(
                                              '13%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                  ],
                );
              });
        });
  }
}

