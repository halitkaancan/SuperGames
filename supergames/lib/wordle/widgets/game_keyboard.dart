import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/game_provider.dart';
import 'game_board.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.wordleGame, {Key? key}) : super(key: key);
  WorldeGame wordleGame;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List keyboadRow1 = "QWERTYUIOP".split("");
  List keyboadRow2 = "ASDFGHJKL".split("");
  List keyboadRow3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WorldeGame.message,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        GameBoard(widget.wordleGame),
        SizedBox(
          height: 40.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: keyboadRow1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.wordleGame.letterId < 5) {
                  print(widget.wordleGame.rowId);
                  widget.wordleGame.insertWord(widget.wordleGame.letterId, Letter(e, 0));
                  widget.wordleGame.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: keyboadRow2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.wordleGame.letterId < 5) {
                  print(widget.wordleGame.rowId);
                  widget.wordleGame.insertWord(widget.wordleGame.letterId, Letter(e, 0));
                  widget.wordleGame.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: keyboadRow3.map((e) {
            return InkWell(
              onTap: () {
                print(e);

                if (e == "DEL") {
                  if (widget.wordleGame.letterId > 0) {
                    setState(() {
                      widget.wordleGame
                          .insertWord(widget.wordleGame.letterId - 1, Letter("", 0));
                      widget.wordleGame.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  // setting the game rules
                  if (widget.wordleGame.letterId >= 5) {

                    String guess = widget.wordleGame.wordleBoard[widget.wordleGame.rowId]
                        .map((e) => e.letter)
                        .join();
                    print(guess);
                    print(WorldeGame.game_guess == guess);
                    if (widget.wordleGame.checkWordExist(guess.toLowerCase())) {
                      if (guess == WorldeGame.game_guess) {
                        setState(() {
                          WorldeGame.message = "Congratulations🎉";
                          widget.wordleGame.wordleBoard[widget.wordleGame.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        print(WorldeGame.game_guess);
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i].toUpperCase();
                          print(
                              "the test: ${WorldeGame.game_guess.contains(char)}");
                          if (WorldeGame.game_guess.contains(char)) {
                            if (WorldeGame.game_guess[i] == char) {
                              setState(() {
                                print(char);
                                widget.wordleGame.wordleBoard[widget.wordleGame.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                print(char);
                                widget.wordleGame.wordleBoard[widget.wordleGame.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                        widget.wordleGame.rowId++;
                        widget.wordleGame.letterId = 0;
                      }
                    } else {
                      WorldeGame.message =
                          "the world does not exist try again";
                    }
                  }
                } else {
                  if (widget.wordleGame.letterId < 5) {
                    print(widget.wordleGame.rowId);
                    widget.wordleGame.insertWord(widget.wordleGame.letterId, Letter(e, 0));
                    widget.wordleGame.letterId++;
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
