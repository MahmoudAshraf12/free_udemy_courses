import 'package:flutter/material.dart';
import 'package:udemy_courses/helper/course.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../helper/data.dart';
import '../model/categories_model.dart';
import '../model/course_model.dart';
import '../widgets/category_title.dart';
import '../widgets/course_title.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List<CategoryModel> categories = [];
  List<CourseModel> courses = [];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getCourse();
  }

  getCourse() async {
    Course courseClass = Course();
    await courseClass.getCourse();
    courses = courseClass.course;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFF747474),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Find your Free Courses",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff232323)),
                    ),
                  ],
                ),
                // Image.asset(
                //   "lib/assets/images/Iconly-Light-Outline-Heart.png",
                //   color: Color(0xff99CAE1),
                // ),
              ],
            ),
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: SpinKitWave(
                  color: Color(0xff99CAE1),
                  size: 30.0,
                ),
              ),
              ////categories
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff232323)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, int index) {
                            return CategoryTile(
                              imageURL: categories[index].imageURL,
                              color: categories[index].color,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Courses",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff232323)),
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: courses.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, int index) {
                            return CourseTile(
                              imageURL: courses[index].image,
                              title: courses[index].heading,
                              courseURL: courses[index].courseLink,
                              successRate: '',
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
