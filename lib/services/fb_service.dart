import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/course_model.dart';

final _fb = FirebaseFirestore.instance;
final fb = FBService();

class FBService {
  Future<List<CourseModel>> allCourses() async {
    try {
      final data = await _fb.collection("courses").get();
      return data.docs.map((e) => CourseModel.fromJson(e.data())).toList();
    } catch (e) {
      print("all: $e");
      return [];
    }
  }
}
