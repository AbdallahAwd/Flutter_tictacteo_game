import 'package:flutter/material.dart';
import 'package:tictacteo/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List disXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  bool isTapped = false;
  int oWins = 0;
  int xWins = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30,),
             Text(
              'Score',
              style: IntroScreen.googleFont,
            ),
            const  SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                         Text(
                        'Player X',
                        style: IntroScreen.googleFont
                      ),
                      const SizedBox(height: 5,),
                      Text(xWins.toString() ,style: IntroScreen.googleFont,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Player O',
                        style: IntroScreen.googleFont
                      ),
                      const SizedBox(height: 5,),
                      Text(oWins.toString() ,style:IntroScreen.googleFont,),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 450,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: ()
                  {
                    _tapped(index);
                    print( filledBoxes);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.5))),
                    child: Center(
                        child: Text(
                      disXO[index],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 40.0),
                    )),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  disXO = [
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                  ];
                  filledBoxes = 0;
                });

              },
              child:  Text(
                'Restart',
                style: IntroScreen.googleFont,
              ),
            ),
            const SizedBox(height: 40,),
            Text('Tic Tac Teo' , style: IntroScreen.googleFont.copyWith(color: Colors.white ,fontSize: 25),),
          ],
        ),
      ),
    );
  }

  void _tapped(index) {

    setState(() {
      isTapped = !isTapped;
      if (isTapped && disXO[index] == '') {
        disXO[index] = "O";
        filledBoxes++;
      } else if (!isTapped && disXO[index] == '') {
        disXO[index] = 'X';
        filledBoxes++;

      }
    });
    checkWinner();
  }

  String? winner;

  void checkWinner() {
    if (disXO[0] == disXO[1] && disXO[0] == disXO[2] && disXO[0] != '') {
      winner = disXO[0];
      showDialogna();
    } else if (disXO[2] == disXO[5] && disXO[2] == disXO[8] && disXO[2] != '') {
      winner = disXO[2];
      showDialogna();
    } else if (disXO[8] == disXO[7] && disXO[8] == disXO[6] && disXO[8] != '') {
      winner = disXO[8];
      showDialogna();
    } else if (disXO[6] == disXO[3] && disXO[6] == disXO[0] && disXO[6] != '') {
      winner = disXO[6];
      showDialogna();
    } else if (disXO[0] == disXO[4] && disXO[0] == disXO[8] && disXO[0] != '') {
      winner = disXO[0];
      showDialogna();
    } else if (disXO[2] == disXO[4] && disXO[2] == disXO[6] && disXO[2] != '') {
      winner = disXO[2];
      showDialogna();
    } else if (disXO[1] == disXO[4] && disXO[1] == disXO[7] && disXO[1] != '') {
      winner = disXO[1];
      showDialogna();
    } else if (disXO[5] == disXO[4] && disXO[5] == disXO[3] && disXO[5] != '')
      {
      winner = disXO[5];
      showDialogna();
      }
    else if(filledBoxes == 9)
      {
        showDialogDraw();
      }
  }

  void showDialogna() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('Winner is $winner'),
              actions: [
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        disXO = [
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                        ];
                        filledBoxes = 0;
                      });
                      Navigator.pop(context);

                    },
                    child:const Text(
                      'Restart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ));
    if(winner == 'O')
      {
        setState(() {
          oWins++;
        });
      }
    else if(winner == 'X')
      {
        xWins++;
      }
  }
  void showDialogDraw() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('Draw'),
              actions: [
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        disXO = [
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                        ];
                        filledBoxes = 0;
                      });
                      Navigator.pop(context);
                    },
                    child:const Text(
                      'Restart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ));
  }


}
