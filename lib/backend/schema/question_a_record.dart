import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'question_a_record.g.dart';

abstract class QuestionARecord
    implements Built<QuestionARecord, QuestionARecordBuilder> {
  static Serializer<QuestionARecord> get serializer =>
      _$questionARecordSerializer;

  String? get question;

  @BuiltValueField(wireName: 'is_true')
  bool? get isTrue;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(QuestionARecordBuilder builder) => builder
    ..question = ''
    ..isTrue = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('question_a')
          : FirebaseFirestore.instance.collectionGroup('question_a');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('question_a').doc();

  static Stream<QuestionARecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuestionARecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuestionARecord._();
  factory QuestionARecord([void Function(QuestionARecordBuilder) updates]) =
      _$QuestionARecord;

  static QuestionARecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuestionARecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = serializers.toFirestore(
    QuestionARecord.serializer,
    QuestionARecord(
      (q) => q
        ..question = question
        ..isTrue = isTrue,
    ),
  );

  return firestoreData;
}
