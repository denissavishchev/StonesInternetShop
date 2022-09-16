import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'colors.dart';
import 'items_widget.dart';
import 'main_screen_widget.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}



class _ItemPageState extends State<ItemPage> {


  bool isPressed = true;

  void favour() {
    setState(() {
      isPressed = !isPressed;
    });

}
  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_main.png'),
                fit: BoxFit.cover),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // onPressed: () => Navigator.of(context).pushNamed('/main_screen'),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MainScreenWidget()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    IconButton(
                      onPressed: favour,
                      icon: Icon(
                        Icons.favorite,
                        color: isPressed ? Colors.white.withOpacity(0.5) : Colors.red,
                        size: 30,),),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 1,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(400, 5),
                    bottomLeft: Radius.elliptical(400, 5),
                    topRight: Radius.elliptical(400, 5),
                    bottomRight: Radius.elliptical(400, 5),
                  ),
                  color: Colors.grey.withOpacity(0.5),
                ),

              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.transparent,
                child: Image.asset('assets/images/devis.png'),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height: 360,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                              width: 1, color: Colors.white.withOpacity(0.5)),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                ItemsWidgetState.stoneNa,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    fontFamily: 'Combo'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'The Energy of the Mind \nis Essence of Life',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 185,
                                height: 35,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border: Border.all(
                                      width: 0.5,
                                      color: Colors.white.withOpacity(0.3)),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 25,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                            Icons.self_improvement,
                                            color: Colors.deepOrange,
                                          ),
                                          Text(
                                            '326',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Container(
                                      height: 25,
                                      width: 100,
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 2,
                                            left: 2,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: Image.asset('assets/images/japan.png'),
                                            ),
                                          ),
                                          Positioned(
                                            top: 2,
                                            left: 15,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: Image.asset('assets/images/usa.png'),
                                            ),
                                          ),
                                          Positioned(
                                            top: 2,
                                            left: 27,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: Image.asset('assets/images/brazil.png'),
                                            ),
                                          ),
                                          const Positioned(
                                            top: 4,
                                            left: 47,
                                            child: Text(' + Brazil', style: TextStyle(color: Colors.white, fontSize: 14),),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20,),
                              const Text('Ability', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 10,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Image.asset('assets/images/life.png'),
                                      width: 20,
                                      height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 10,),
                                              Text('Life', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text('29%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 10,
                                            color: Colors.transparent,
                                            child: LinearPercentIndicator(
                                              barRadius: const Radius.circular(10),
                                              lineHeight: 6,
                                              percent: 0.29,
                                              progressColor: Colors.green,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Image.asset('assets/images/brain.png'),
                                        width: 20,
                                        height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 10,),
                                              Text('Wisdom', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text('15%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 10,
                                            color: Colors.transparent,
                                            child: LinearPercentIndicator(
                                              barRadius: const Radius.circular(10),
                                              lineHeight: 6,
                                              percent: 0.15,
                                              progressColor: Colors.blueAccent,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Image.asset('assets/images/energy.png'),
                                        width: 20,
                                        height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 10,),
                                              Text('Energy', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text('88%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 10,
                                            color: Colors.transparent,
                                            child: LinearPercentIndicator(
                                              barRadius: const Radius.circular(10),
                                              lineHeight: 6,
                                              percent: 0.88,
                                              progressColor: Colors.orangeAccent,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Image.asset('assets/images/charisma.png'),
                                        width: 20,
                                        height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 10,),
                                              Text('Charisma', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text('12%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 10,
                                            color: Colors.transparent,
                                            child: LinearPercentIndicator(
                                              barRadius: const Radius.circular(10),
                                              lineHeight: 6,
                                              percent: 0.12,
                                              progressColor: Colors.yellowAccent,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Image.asset('assets/images/death.png'),
                                        width: 20,
                                        height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 10,),
                                              Text('Death', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text('56%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 10,
                                            color: Colors.transparent,
                                            child: LinearPercentIndicator(
                                              barRadius: const Radius.circular(10),
                                              lineHeight: 6,
                                              percent: 0.56,
                                              progressColor: Colors.black,
                                              backgroundColor: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 150,
                      child: SizedBox(
                        width: 400,
                          height: 400,
                          child: Image.asset(ItemsWidgetState.stoneIm)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
