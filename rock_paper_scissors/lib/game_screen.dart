import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> images = [
    "assets/images/rock.png",
    "assets/images/paper.png",
    "assets/images/scissors.png",
  ];

  int comOpt = 0;

  final Random random = Random();

  int _decideWinner(int index) {
    comOpt = random.nextInt(3);

    switch (index) {
      case 0:
        if (comOpt == index)
          return -1;
        else if (comOpt == 1)
          return 1;
        else
          return 0;

      case 1:
        if (comOpt == index)
          return -1;
        else if (comOpt == 0)
          return 0;
        else
          return 1;

      case 2:
        if (comOpt == index)
          return -1;
        else if (comOpt == 1)
          return 0;
        else
          return 1;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 44, 76),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 15, 110, 187),
          title: Text(
            "Rock Paper Scissors",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose your Weapon",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 3; i++)
                InkWell(
                  onTap: () {
                    final winner = _decideWinner(i);
                    showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Result"),
                              content: SingleChildScrollView(
                                child: ListBody(children: [
                                  Row(
                                    children: [
                                      Text("You chose: "),
                                      Image.asset(images[i], width: 40,),
                                      
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Computer chosed: "),
                                      Image.asset(images[comOpt], width: 40,)
                                    ],
                                  ),
                                  Text(winner == -1
                                      ? "Urgh , it's a draw"
                                      : winner == 0
                                          ? "congratulation, you won"
                                          : "Sorry , you lost")
                                ]),
                              ),
                              actions: <Widget>[
                                TextButton(onPressed: () {
                                  setState(() {
                                    
                                  });
                                  Navigator.of(context).pop();
                                }, child: Text("Play again"))
                              ]);
                        });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(images[i]),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
