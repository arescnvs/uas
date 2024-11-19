import '../models/answer.dart';

class Question {
  final int id;
  final String title;
  final String content;
  final String subject;
  int upvotes;
  int downvotes;
  bool isUpvoted;
  bool isDownvoted;
  List<Answer> answers;

  Question({
    required this.id,
    required this.title,
    required this.content,
    required this.subject,
    this.answers = const [],
    this.upvotes = 0,
    this.downvotes = 0,
    this.isUpvoted = false,
    this.isDownvoted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'subject': subject,
      'upvotes': upvotes,
      'downvotes': downvotes,
      'isUpvoted': isUpvoted ? 1 : 0,
      'isDownvoted': isDownvoted ? 1 : 0,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      subject: map['subject'],
      upvotes: map['upvotes'],
      downvotes: map['downvotes'],
      isUpvoted: map['isUpvoted'] == 1,
      isDownvoted: map['isDownvoted'] == 1,
      answers: [],
    );
  }
}
