import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'question_c_record.g.dart';

abstract class QuestionCRecord
    implements Built<QuestionCRecord, QuestionCRecordBuilder> {
  static Serializer<QuestionCRecord> get serializer =>
      _$questionCRecordSerializer;

  String? get question;

  @BuiltValueField(wireName: 'is_true')
  bool? get isTrue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(QuestionCRecordBuilder builder) => builder
    ..question = ''
    ..isTrue = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('question_c')
          : FirebaseFirestore.instance.collectionGroup('question_c');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('question_c').doc();

  static Stream<QuestionCRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuestionCRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuestionCRecord._();
  factory QuestionCRecord([void Function(QuestionCRecordBuilder) updates]) =
      _$QuestionCRecord;

  static QuestionCRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuestionCRecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = serializers.toFirestore(
    QuestionCRecord.serializer,
    QuestionCRecord(
      (q) => q
        ..question = question
        ..isTrue = isTrue,
    ),
  );

  return firestoreData;
}
