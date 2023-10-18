part of 'imports.dart';

class HomeVM extends ChangeNotifier {
  String selectedCat = "Design";
  List<CourseModel> courses = [];
  bool isLoading = false;

  HomeVM() {
    init();
  }

  void selectCat(String cat) {
    selectedCat = cat;
    notifyListeners();
  }

  void init() async {
    isLoading = !isLoading;
    notifyListeners();
    courses = await fb.allCourses();
    isLoading = !isLoading;
    notifyListeners();
  }

  List<CourseModel> get catCourses =>
      courses.where((element) => element.cat == selectedCat).toList();
}
