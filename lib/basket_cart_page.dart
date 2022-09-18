import 'package:flutter/material.dart';
import 'package:stones/basket_page.dart';
import 'package:stones/colors.dart';
import 'package:stones/main.dart';
import 'basket_items_widget.dart';
import 'main_screen_widget.dart';

class BasketCartPage extends StatefulWidget {
  const BasketCartPage({Key? key}) : super(key: key);

  @override
  State<BasketCartPage> createState() => _BasketCartPageState();
}

class _BasketCartPageState extends State<BasketCartPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkGrey.withOpacity(0.3),
      child: Column(
        children: [
          Expanded(child: BasketItemsWidget()),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.transparent,
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 190,
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(
                          width: 1, color: Colors.white.withOpacity(0.5))),
                  child: Column(
                    children: [
                      const Text(
                        'Total Abilities',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Image.asset('assets/images/life.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Image.asset('assets/images/wisdom.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Image.asset('assets/images/energy.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child:
                                Image.asset('assets/images/charisma.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
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
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Image.asset('assets/images/death.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
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
                      )
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(
                          width: 1, color: Colors.white.withOpacity(0.5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Total Price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '\$ 243',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                                width: 1, color: Colors.white.withOpacity(
                                0.5))),
                        child: Row(
                          children: [
                            const SizedBox(width: 5,),
                            const Icon(Icons.arrow_right_outlined, color: Colors.deepOrange, size: 30,),
                            Expanded(
                                child: SizedBox(
                                    height: 30,
                                    child: Image.asset('assets/images/basket/address.png'))),
                            const SizedBox(width: 5,),
                          ],
                        ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
