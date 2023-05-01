import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'question_b_record.g.dart';

abstract class QuestionBRecord
    implements Built<QuestionBRecord, QuestionBRecordBuilder> {
  static Serializer<QuestionBRecord> get serializer =>
      _$questionBRecordSerializer;

  String? get question;

  @BuiltValueField(wireName: 'is_true')
  bool? get isTrue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(QuestionBRecordBuilder builder) => builder
    ..question = ''
    ..isTrue = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('question_b')
          : FirebaseFirestore.instance.collectionGroup('question_b');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('question_b').doc();

  static Stream<QuestionBRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuestionBRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuestionBRecord._();
  factory QuestionBRecord([void Function(QuestionBRecordBuilder) updates]) =
      _$QuestionBRecord;

  static QuestionBRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuestionBRecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = serializers.toFirestore(
    QuestionBRecord.serializer,
    QuestionBRecord(
      (q) => q
        ..question = question
        ..isTrue = isTrue,
    ),
  );

  return firestoreData;
}
