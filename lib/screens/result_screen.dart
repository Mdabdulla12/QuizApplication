import 'package:flutter/material.dart';
import 'package:quizapp7060/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color maincolor = const Color(0xFF252c4a);
    Color secondColor = const Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                  "Congratulations",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 20.0),
            const Text(
              "Your score is:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),

                const SizedBox(height: 50.0),
                Text(
                  "${widget.score}",
                  style:
                  const TextStyle(
                      color: Colors.orange,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
            SizedBox(height: 60.0),
            MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                },
              elevation: 0.0,
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the Quizz"),
            ),
            const SizedBox(height: 100.0),
            Text(
              "This Quizz created by Md.Abdulla.Gaur",
              style:
              const TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),

            ),



              ],
            ),
      ),

      );

  }
}
