import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quiz_record.g.dart';

abstract class QuizRecord implements Built<QuizRecord, QuizRecordBuilder> {
  static Serializer<QuizRecord> get serializer => _$quizRecordSerializer;

  int? get id;

  String? get question;

  @BuiltValueField(wireName: 'quiz_set')
  DocumentReference? get quizSet;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(QuizRecordBuilder builder) => builder
    ..id = 0
    ..question = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  QuizRecord._();
  factory QuizRecord([void Function(QuizRecordBuilder) updates]) = _$QuizRecord;

  static QuizRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createQuizRecordData({
  int? id,
  String? question,
  DocumentReference? quizSet,
}) {
  final firestoreData = serializers.toFirestore(
    QuizRecord.serializer,
    QuizRecord(
      (q) => q
        ..id = id
        ..question = question
        ..quizSet = quizSet,
    ),
  );

  return firestoreData;
}
