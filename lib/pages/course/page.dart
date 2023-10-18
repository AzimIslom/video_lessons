part of 'imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: const [
              _AppBar(),
              _Top(),
              SizedBox(height: 7.5),
              _TopCourses(),
              SizedBox(height: 15),
              _Cat(),
              _Courses(),
            ],
          ),
        ),
      ),
    );
  }
}
