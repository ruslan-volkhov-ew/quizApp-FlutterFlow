import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'question_d_record.g.dart';

abstract class QuestionDRecord
    implements Built<QuestionDRecord, QuestionDRecordBuilder> {
  static Serializer<QuestionDRecord> get serializer =>
      _$questionDRecordSerializer;

  String? get question;

  @BuiltValueField(wireName: 'is_true')
  bool? get isTrue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(QuestionDRecordBuilder builder) => builder
    ..question = ''
    ..isTrue = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('question_d')
          : FirebaseFirestore.instance.collectionGroup('question_d');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('question_d').doc();

  static Stream<QuestionDRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuestionDRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuestionDRecord._();
  factory QuestionDRecord([void Function(QuestionDRecordBuilder) updates]) =
      _$QuestionDRecord;

  static QuestionDRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuestionDRecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = serializers.toFirestore(
    QuestionDRecord.serializer,
    QuestionDRecord(
      (q) => q
        ..question = question
        ..isTrue = isTrue,
    ),
  );

  return firestoreData;
}
