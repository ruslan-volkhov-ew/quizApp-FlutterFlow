import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionBRecord extends FirestoreRecord {
  QuestionBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "is_true" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _isTrue = snapshotData['is_true'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('question_b')
          : FirebaseFirestore.instance.collectionGroup('question_b');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('question_b').doc();

  static Stream<QuestionBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionBRecord.fromSnapshot(s));

  static Future<QuestionBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionBRecord.fromSnapshot(s));

  static QuestionBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionBRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createQuestionBRecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'is_true': isTrue,
    }.withoutNulls,
  );

  return firestoreData;
}
