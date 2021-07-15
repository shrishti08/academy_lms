import 'package:flutter/cupertino.dart';

class Lessons {
  int id;
  String title;
  String duration;
  String videoUrl = '';
  String lessonType;
  String summary;
  String attachmentType;
  String attachment;
  String attachmentUrl;
  String isCompleted;
  String videoUrlWeb;
  String videoTypeWeb;
  String vimeoVideoId;

  Lessons.lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.lessonType,
    this.summary = '',
    this.attachmentType = '',
    this.attachment = '',
    this.attachmentUrl = '',
    this.isCompleted = '',
    this.videoUrlWeb = '',
    this.videoTypeWeb = '',
    this.vimeoVideoId = '',
  });

  Lessons copyWith({
    int? id,
    String? title,
    String? duration,
    String? videoUrl = '',
    String? lessonType,
    String? summary,
    String? attachmentType,
    String? attachment,
    String? attachmentUrl,
    String? isCompleted,
    String? videoUrlWeb,
    String? videoTypeWeb,
    String? vimeoVideoId,
  }) {
    return Lessons.lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      lessonType: lessonType ?? this.lessonType,
      summary: summary ?? this.summary,
      attachmentType: attachmentType ?? this.attachmentType,
      attachment: attachment ?? this.attachment,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      isCompleted: isCompleted ?? this.isCompleted,
      videoUrlWeb: videoUrlWeb ?? this.videoUrlWeb,
      videoTypeWeb: videoTypeWeb ?? this.videoTypeWeb,
      vimeoVideoId: vimeoVideoId ?? this.vimeoVideoId,
    );
  }
}
