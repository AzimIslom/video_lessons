class UserModel {
  late String id;
  late String tel;
  late String password;
  late List<MyCoursesModel> courses;

  UserModel({
    required this.id,
    required this.password,
    required this.tel,
    required this.courses,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    tel = json['tel'];
    courses = List.from(json['courses'])
        .map((e) => MyCoursesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'tel': tel,
        'course': courses.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class MyCoursesModel {
  late String courseId;
  late String lastVideoId;
  late int duration;
  late List<ChapterDoneModel> chapters;

  MyCoursesModel({
    required this.chapters,
    required this.courseId,
    required this.duration,
    required this.lastVideoId,
  });

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    chapters = List.from(json['chapters'])
        .map((e) => ChapterDoneModel.fromJson(e))
        .toList();
    duration = json['duration'];
    lastVideoId = json['lastVideoId'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() => {
        'chapters': chapters.map((e) => e.toJson()).toList(),
        'duration': duration,
        'lastVideoId': lastVideoId,
        'courseId': courseId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class ChapterDoneModel {
  late String videoId;
  late DateTime done;
  late String by;

  ChapterDoneModel({
    required this.by,
    required this.done,
    required this.videoId,
  });

  ChapterDoneModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    done = json['done'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() => {
        'by': by,
        'done': done,
        'videoId': videoId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
