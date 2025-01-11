import 'package:flutter/material.dart';
import 'package:quizapp/Views/question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '✏️',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Flutter Quiz',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return QuestionScreen();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    }
                  )
                );
              }, 
              child: Text('New Game'),
            )
          ],
        ),
      ),
    );
  }
}