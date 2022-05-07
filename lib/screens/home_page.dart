import 'package:flutter/material.dart';
import 'package:udemy_courses/components/components.dart';
import 'package:udemy_courses/screens/courses_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            Image.asset('lib/assets/images/Group 26.png'),
            SizedBox(
              height: 36.0,
            ),
            Text(
              'Find Your Favouet Course',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xffBBBBBB),
              ),
            ),
            Spacer(),
            defaultButton(
              width: double.infinity,
              background: Color(0xff6CC4EE),
              function: () {
                navicateAndFinished(context, CoursesScreen());
              },
              text: 'Get Start',
            ),
          ],
        ),
      ),
    );
  }
}
