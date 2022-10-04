import 'package:flutter/material.dart';
import 'package:quizapp7060/data/question_list.dart';
import 'package:quizapp7060/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color maincolor = Color(0xff1f74e0);
  Color secondColor = Color(0xff0a0707);
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_vari
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (Page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: question.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                        "Question ${index + 1}/${question.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 2.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  question[index].question!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < question[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? question[index].answer!.entries.toList()[i].value
                          ? isTrue
                          : isWrong
                          : secondColor,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                        setState(() {
                          isPressed = true;
                        });
                        if (question[index]
                            .answer!
                            .entries
                            .toList()[i]
                            .value) {
                          score += 10;
                          print(score);
                        }
                      },
                      child: Text(
                        question[index].answer!.keys.toList()[i],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == question.length
                          ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(score)));
                      }
                          : () {
                        _controller!.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                        setState(() {
                          isPressed = false;
                        });
                      }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                            color: Colors.orange, width: 2.0),
                      ),

                      child: Text(
                          index + 1 == question.length
                              ? "See result"
                              : "Next Question",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

