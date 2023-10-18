class CourseModel {
  late String title;
  late String avatar;
  late String des;
  late List<VideoModel> chapters;
  late String cat;
  late String id;

  CourseModel({
    required this.title,
    required this.des,
    required this.chapters,
    required this.avatar,
    required this.cat,
    required this.id,
  });

  CourseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    des = json['des'];
    chapters =
        List.from(json['chapters']).map((e) => VideoModel.fromJson(e)).toList();
    avatar = json['avatar'];
    cat = json['cat'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'des': des,
        'chapters': chapters.map((e) => e.toJson()).toList(),
        'avatar': avatar,
        'cat': cat,
        'id': id,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

// class ChapterModel {
//   late String title;
//   late String des;
//   late String id;
//   late String courseId;
//   late List<VideoModel> videos;
//
//   ChapterModel({
//     required this.title,
//     required this.des,
//     required this.id,
//     required this.courseId,
//     required this.videos,
//   });
//
//   ChapterModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     des = json['des'];
//     id = json['id'];
//     courseId = json['courseId'];
//     videos =
//         List.from(json['videos']).map((e) => VideoModel.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'des': des,
//         'id': id,
//         'courseId': courseId,
//         'videos': videos.map((e) => e.toJson()).toList(),
//       };
//
//   @override
//   String toString() {
//     return toJson().toString();
//   }
// }

class VideoModel {
  late String id;
  late String chapterId;
  late String title;
  late String des;
  late String link;

  VideoModel({
    required this.title,
    required this.id,
    required this.des,
    required this.chapterId,
    required this.link,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    des = json['des'];
    chapterId = json['chapterId'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'des': des,
        'chapterId': chapterId,
        'link': link,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class QuestionModel {
  late String title;
  late String des;
  late String id;
  late String by;
  late List<AnswerModel> answers;

  QuestionModel({
    required this.by,
    required this.id,
    required this.title,
    required this.des,
    required this.answers,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    id = json['id'];
    title = json['title'];
    des = json['des'];
    answers =
        List.from(json['answers']).map((e) => AnswerModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'by': by,
        'id': id,
        'title': title,
        'des': des,
        'answers': answers.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class AnswerModel {
  late String questionId;
  late String answer;

  AnswerModel({
    required this.answer,
    required this.questionId,
  });

  AnswerModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'questionId': questionId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
