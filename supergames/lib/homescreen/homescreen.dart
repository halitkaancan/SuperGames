import 'package:flutter/material.dart';
import 'package:tictactoe/tictactoe/tictactoe.dart';

import '../catchmeifyoucan/catch_the_guy.dart';
import '../othergame/othergame.dart';
import '../tictactoe/colors.dart';
import '../wordle/screens/game_screen.dart';


class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Eğlenceye başlayın... "),
        backgroundColor: Colors.transparent,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/background.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [

                  ElevatedButton.icon(
                    icon: const Icon(Icons.close) ,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const tictactoe()),
                      );
                    },
                    label: const Text("TicTacToe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.catching_pokemon) ,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatchTheGuy()),
                  );
                },
                label: const Text("   Catch Me If You Can   ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),

              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.wordpress) ,

                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const gamescreen()),
                  );
                },

                label:
                 const Text("   Wordle   ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.next_week_rounded) ,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const othergame()),
                  );
                },
                label: const Text("   Future Game   ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),



            ],
          ),
        ),
      ),
    );
  }
}


class PageY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Y"),
      ),
      body: const Center(
        child: Text("This is Page Y"),
      ),
    );
  }
}
