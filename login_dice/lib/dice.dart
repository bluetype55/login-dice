import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset('image/dice$leftDice.png'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Image.asset('image/dice$rightDice.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                });
                showToast(
                  "Left dice: $leftDice, Right dice: $rightDice",
                  context: context,
                  animation: StyledToastAnimation.none,
                );
                //showToast("Left dice: {$leftDice}, Right dice: {$rightDice}");
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 60),
                  backgroundColor: Colors.orangeAccent),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
