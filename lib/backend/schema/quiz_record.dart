import 'dart:async';

import '../../pages/authentication/authentication_widget.dart';
import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "quiz_set" field.
  DocumentReference? _quizSet;
  DocumentReference? get quizSet => _quizSet;
  bool hasQuizSet() => _quizSet != null;

  void _initializeFields() {
    _id = snapshotData['id'] as int?;
    _question = snapshotData['question'] as String?;
    _quizSet = snapshotData['quiz_set'] as DocumentReference?;
  }

  static CollectionReference get collection => firebaseApp == null
      ? FirebaseFirestore.instance.collection('quiz')
      : FirebaseFirestore.instanceFor(app: firebaseApp!).collection('quiz');
  // FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createQuizRecordData({
  int? id,
  String? question,
  DocumentReference? quizSet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'question': question,
      'quiz_set': quizSet,
    }.withoutNulls,
  );

  return firestoreData;
}
