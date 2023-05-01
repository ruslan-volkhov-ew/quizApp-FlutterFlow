// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_b_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionBRecord> _$questionBRecordSerializer =
    new _$QuestionBRecordSerializer();

class _$QuestionBRecordSerializer
    implements StructuredSerializer<QuestionBRecord> {
  @override
  final Iterable<Type> types = const [QuestionBRecord, _$QuestionBRecord];
  @override
  final String wireName = 'QuestionBRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuestionBRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isTrue;
    if (value != null) {
      result
        ..add('is_true')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  QuestionBRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionBRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_true':
          result.isTrue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$QuestionBRecord extends QuestionBRecord {
  @override
  final String? question;
  @override
  final bool? isTrue;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuestionBRecord([void Function(QuestionBRecordBuilder)? updates]) =>
      (new QuestionBRecordBuilder()..update(updates))._build();

  _$QuestionBRecord._({this.question, this.isTrue, this.ffRef}) : super._();

  @override
  QuestionBRecord rebuild(void Function(QuestionBRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBRecordBuilder toBuilder() =>
      new QuestionBRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionBRecord &&
        question == other.question &&
        isTrue == other.isTrue &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, isTrue.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestionBRecord')
          ..add('question', question)
          ..add('isTrue', isTrue)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuestionBRecordBuilder
    implements Builder<QuestionBRecord, QuestionBRecordBuilder> {
  _$QuestionBRecord? _$v;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  bool? _isTrue;
  bool? get isTrue => _$this._isTrue;
  set isTrue(bool? isTrue) => _$this._isTrue = isTrue;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuestionBRecordBuilder() {
    QuestionBRecord._initializeBuilder(this);
  }

  QuestionBRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _question = $v.question;
      _isTrue = $v.isTrue;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionBRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionBRecord;
  }

  @override
  void update(void Function(QuestionBRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionBRecord build() => _build();

  _$QuestionBRecord _build() {
    final _$result = _$v ??
        new _$QuestionBRecord._(
            question: question, isTrue: isTrue, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
