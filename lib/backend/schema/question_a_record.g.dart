// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_a_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionARecord> _$questionARecordSerializer =
    new _$QuestionARecordSerializer();

class _$QuestionARecordSerializer
    implements StructuredSerializer<QuestionARecord> {
  @override
  final Iterable<Type> types = const [QuestionARecord, _$QuestionARecord];
  @override
  final String wireName = 'QuestionARecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuestionARecord object,
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
  QuestionARecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionARecordBuilder();

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

class _$QuestionARecord extends QuestionARecord {
  @override
  final String? question;
  @override
  final bool? isTrue;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuestionARecord([void Function(QuestionARecordBuilder)? updates]) =>
      (new QuestionARecordBuilder()..update(updates))._build();

  _$QuestionARecord._({this.question, this.isTrue, this.ffRef}) : super._();

  @override
  QuestionARecord rebuild(void Function(QuestionARecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionARecordBuilder toBuilder() =>
      new QuestionARecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionARecord &&
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
    return (newBuiltValueToStringHelper(r'QuestionARecord')
          ..add('question', question)
          ..add('isTrue', isTrue)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuestionARecordBuilder
    implements Builder<QuestionARecord, QuestionARecordBuilder> {
  _$QuestionARecord? _$v;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  bool? _isTrue;
  bool? get isTrue => _$this._isTrue;
  set isTrue(bool? isTrue) => _$this._isTrue = isTrue;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuestionARecordBuilder() {
    QuestionARecord._initializeBuilder(this);
  }

  QuestionARecordBuilder get _$this {
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
  void replace(QuestionARecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionARecord;
  }

  @override
  void update(void Function(QuestionARecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionARecord build() => _build();

  _$QuestionARecord _build() {
    final _$result = _$v ??
        new _$QuestionARecord._(
            question: question, isTrue: isTrue, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
