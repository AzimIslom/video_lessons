part of 'imports.dart';

class ExplorePage extends StatelessWidget {
  final CourseModel course;

  const ExplorePage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExploreVM>(
      create: (_) => ExploreVM(course),
      child: const Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
          left: false,
          right: false,
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                _Top(),
                _Body(),
                _Bottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
