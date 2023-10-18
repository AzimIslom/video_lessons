part of 'imports.dart';

class ExploreVM extends ChangeNotifier {
  late CourseModel course;
  bool isLoading = false;
  int current = 0;

  ExploreVM(this.course);

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
