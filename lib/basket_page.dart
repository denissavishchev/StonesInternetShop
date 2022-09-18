import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stones/items_widget.dart';
import 'basket_cart_page.dart';
import 'basket_items_widget.dart';
import 'main_screen_widget.dart';
import 'package:stones/colors.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => BasketScreenState();
}

int selectedTab = 0;

class BasketScreenState extends State<BasketScreen> with SingleTickerProviderStateMixin{
  void back() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreenWidget()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('basket').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) return Text('No data');
      return MaterialApp(
        home: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_main.png'),
                      fit: BoxFit.cover),
                ),
                width: double.infinity,
                height: double.infinity,
                child: const TabBarView(
                  children: [
                    BasketCartPage(),
                    Icon(Icons.monitor),
                    Icon(Icons.garage),
                    Icon(Icons.person),
                  ],
                ),
              ),
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Theme(
                  data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent
                  ),
                  child: AppBar(
                    toolbarHeight: 30,
                    flexibleSpace: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: back,
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'Cart',
                            style: TextStyle(
                                fontFamily: 'Combo',
                                fontSize: 40,
                                color: kWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  left: 30,
                                  child: CircleAvatar(
                                      backgroundColor: kBlue,
                                      radius: 10,
                                      child: Text(
                                        (snapshot.data?.docs.length).toString(),
                                        style: const TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold),))),
                              CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  child: const Icon(Icons.shopping_basket_outlined,
                                    color: Colors.white,)),
                            ],
                          ),
                          IconButton(
                            onPressed: back,
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: kDarkGrey,
                    // shadowColor: Colors.limeAccent,
                    elevation: 10,
                    bottom: TabBar(
                      onTap: (index) {
                        selectedTab = index;
                        setState(() {});
                      },
                      labelColor: Colors.deepOrange,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.transparent,
                      indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.transparent),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                color: selectedTab == 0
                                    ? kBlue.withOpacity(0.7)
                                    : Colors.transparent,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                              'assets/images/basket/cart.png'))),
                                  const Icon(Icons.arrow_right_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                color: selectedTab == 1
                                    ? kBlue.withOpacity(0.7)
                                    : Colors.transparent,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                              'assets/images/basket/address.png'))),
                                  const Icon(Icons.arrow_right_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                color: selectedTab == 2
                                    ? kBlue.withOpacity(0.7)
                                    : Colors.transparent,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                              'assets/images/basket/payment.png'))),
                                  const Icon(Icons.arrow_right_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                color: selectedTab == 3
                                    ? kBlue.withOpacity(0.7)
                                    : Colors.transparent,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                      child: SizedBox(
                                          height: 20,
                                          child: Image.asset(
                                              'assets/images/basket/done.png'))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
