// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizRecord> _$quizRecordSerializer = new _$QuizRecordSerializer();

class _$QuizRecordSerializer implements StructuredSerializer<QuizRecord> {
  @override
  final Iterable<Type> types = const [QuizRecord, _$QuizRecord];
  @override
  final String wireName = 'QuizRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuizRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quizSet;
    if (value != null) {
      result
        ..add('quiz_set')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  QuizRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'quiz_set':
          result.quizSet = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$QuizRecord extends QuizRecord {
  @override
  final int? id;
  @override
  final String? question;
  @override
  final DocumentReference<Object?>? quizSet;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuizRecord([void Function(QuizRecordBuilder)? updates]) =>
      (new QuizRecordBuilder()..update(updates))._build();

  _$QuizRecord._({this.id, this.question, this.quizSet, this.ffRef})
      : super._();

  @override
  QuizRecord rebuild(void Function(QuizRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizRecordBuilder toBuilder() => new QuizRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizRecord &&
        id == other.id &&
        question == other.question &&
        quizSet == other.quizSet &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, quizSet.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizRecord')
          ..add('id', id)
          ..add('question', question)
          ..add('quizSet', quizSet)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuizRecordBuilder implements Builder<QuizRecord, QuizRecordBuilder> {
  _$QuizRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  DocumentReference<Object?>? _quizSet;
  DocumentReference<Object?>? get quizSet => _$this._quizSet;
  set quizSet(DocumentReference<Object?>? quizSet) => _$this._quizSet = quizSet;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuizRecordBuilder() {
    QuizRecord._initializeBuilder(this);
  }

  QuizRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _question = $v.question;
      _quizSet = $v.quizSet;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizRecord;
  }

  @override
  void update(void Function(QuizRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizRecord build() => _build();

  _$QuizRecord _build() {
    final _$result = _$v ??
        new _$QuizRecord._(
            id: id, question: question, quizSet: quizSet, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
