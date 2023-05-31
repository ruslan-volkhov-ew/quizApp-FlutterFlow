import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSetRecord extends FirestoreRecord {
  QuizSetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quiz_name" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "total_questions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  bool hasTotalQuestions() => _totalQuestions != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "cover_photo" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _quizName = snapshotData['quiz_name'] as String?;
    _duration = snapshotData['duration'] as int?;
    _totalQuestions = snapshotData['total_questions'] as int?;
    _description = snapshotData['description'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizSet');

  static Stream<QuizSetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSetRecord.fromSnapshot(s));

  static Future<QuizSetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSetRecord.fromSnapshot(s));

  static QuizSetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSetRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createQuizSetRecordData({
  String? quizName,
  int? duration,
  int? totalQuestions,
  String? description,
  String? coverPhoto,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz_name': quizName,
      'duration': duration,
      'total_questions': totalQuestions,
      'description': description,
      'cover_photo': coverPhoto,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}
