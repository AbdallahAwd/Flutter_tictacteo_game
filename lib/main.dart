import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictacteo/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Teo ',
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  static var googleFont = GoogleFonts.pressStart2p(
      letterSpacing: 3,
      color: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Text('Tic Tac Teo', style: googleFont.copyWith(fontSize: 20),),
              const SizedBox(height: 20,),
              AvatarGlow(
                duration: Duration(seconds: 2),
                animate: true,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                glowColor: Colors.white,
                endRadius: 150,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[900],
                  backgroundImage: AssetImage('assets/tic.png'),
                ),
              ),
              const SizedBox(height: 50,),
              Text('@Abdullah_Mostafa', style: googleFont,),
              const SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                   primary:Colors.white,
                    minimumSize: const Size(double.infinity , 50),
                    onPrimary: Colors.grey[900],

                  ),
                  child: Text('Play Game' , style: googleFont.copyWith(color: Colors.grey[900]),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
