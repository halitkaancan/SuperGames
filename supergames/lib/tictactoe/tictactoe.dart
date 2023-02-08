import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class tictactoe extends StatefulWidget {
  const tictactoe({super.key});

  @override
  State<tictactoe> createState() => _tictactoeState();
}

class _tictactoeState extends State<tictactoe> {
  bool turn = true;
  List<String> display = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  int initiative = 0;

  int o_Score = 0;
  int x_Score = 0;
  int filledBoxes = 0;
  String result = '';
  bool winnerFound = false;

  static const lastSecont = 30;
  int seconds = lastSecont;
  Timer? timer;

  static var customFontWhite = GoogleFonts.coiny(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 4,
      fontSize: 25,
    ),
  );

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = lastSecont;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Oyuncu O',
                        style: customFontWhite,
                      ),
                      Text(
                        o_Score.toString(),
                        style: customFontWhite,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Oyuncu X',
                        style: customFontWhite,
                      ),
                      Text(
                        x_Score.toString(),
                        style: customFontWhite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 5,
                            color: MainColor.backgroundColor,
                          ),
                          color: matchedIndexes.contains(index)
                              ? MainColor.winColor
                              : MainColor.gameboardColor,
                        ),
                        child: Center(
                          child: Text(
                            display[index],
                            style: GoogleFonts.coiny(
                                textStyle: TextStyle(
                                  fontSize: 64,
                                  color: matchedIndexes.contains(index)
                                      ? MainColor.gameboardColor
                                      : MainColor.backgroundColor,
                                )),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(result, style: customFontWhite),
                    const SizedBox(height: 10),
                    _buildTimer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;

    if (isRunning) {
      setState(() {
        if (turn && display[index] == '') {
          display[index] = 'O';
          filledBoxes++;
        } else if (!turn && display[index] == '') {
          display[index] = 'X';
          filledBoxes++;
        }

        turn = !turn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    // check 1st row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      setState(() {
        result = 'Oyuncu ' + display[0] + ' Kazandı!';
        matchedIndexes.addAll([0, 1, 2]);
        stopTimer();
        _updateScore(display[0]);
      });
    }

    // check 2nd row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      setState(() {
        result = 'Oyuncu ' + display[3] + ' Kazandı!';
        matchedIndexes.addAll([3, 4, 5]);
        stopTimer();
        _updateScore(display[3]);
      });
    }

    // check 3rd row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      setState(() {
        result = 'Oyuncu ' + display[6] + ' Kazandı!';
        matchedIndexes.addAll([6, 7, 8]);
        stopTimer();
        _updateScore(display[6]);
      });
    }

    // check 1st column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      setState(() {
        result = 'Oyuncu ' + display[0] + ' Kazandı!';
        matchedIndexes.addAll([0, 3, 6]);
        stopTimer();
        _updateScore(display[0]);
      });
    }

    // check 2nd column
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      setState(() {
        result = 'Oyuncu ' + display[1] + ' Kazandı!';
        matchedIndexes.addAll([1, 4, 7]);
        stopTimer();
        _updateScore(display[1]);
      });
    }

    // check 3rd column
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      setState(() {
        result = 'Oyuncu ' + display[2] + ' Kazandı!';
        matchedIndexes.addAll([2, 5, 8]);
        stopTimer();
        _updateScore(display[2]);
      });
    }

    // check diagonal
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      setState(() {
        result = 'Oyuncu ' + display[0] + ' Kazandı!';
        matchedIndexes.addAll([0, 4, 8]);
        stopTimer();
        _updateScore(display[0]);
      });
    }

    // check diagonal
    if (display[6] == display[4] &&
        display[6] == display[2] &&
        display[6] != '') {
      setState(() {
        result = 'Oyuncu ' + display[6] + ' Kazandı!';
        matchedIndexes.addAll([6, 4, 2]);
        stopTimer();
        _updateScore(display[6]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        result = 'Berabere!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      o_Score++;
    } else if (winner == 'X') {
      x_Score++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        display[i] = '';
      }
      result = '';
      matchedIndexes = [];
    });
    filledBoxes = 0;
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - seconds / lastSecont,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 8,
            backgroundColor: MainColor.winColor,
          ),
          Center(
            child: Text(
              '$seconds',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
        ],
      ),
    )
        : ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
      onPressed: () {
        startTimer();
        _clearBoard();
        initiative++;
      },
      child: Text(
        initiative == 0 ? 'Start' : 'Tekrar Oyna!',
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}