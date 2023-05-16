// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_set_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizSetRecord> _$quizSetRecordSerializer =
    new _$QuizSetRecordSerializer();

class _$QuizSetRecordSerializer implements StructuredSerializer<QuizSetRecord> {
  @override
  final Iterable<Type> types = const [QuizSetRecord, _$QuizSetRecord];
  @override
  final String wireName = 'QuizSetRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, QuizSetRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.quizName;
    if (value != null) {
      result
        ..add('quiz_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalQuestions;
    if (value != null) {
      result
        ..add('total_questions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.coverPhoto;
    if (value != null) {
      result
        ..add('cover_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  QuizSetRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizSetRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'quiz_name':
          result.quizName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_questions':
          result.totalQuestions = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cover_photo':
          result.coverPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$QuizSetRecord extends QuizSetRecord {
  @override
  final String? quizName;
  @override
  final int? duration;
  @override
  final int? totalQuestions;
  @override
  final String? description;
  @override
  final String? coverPhoto;
  @override
  final String? userId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$QuizSetRecord([void Function(QuizSetRecordBuilder)? updates]) =>
      (new QuizSetRecordBuilder()..update(updates))._build();

  _$QuizSetRecord._(
      {this.quizName,
      this.duration,
      this.totalQuestions,
      this.description,
      this.coverPhoto,
      this.userId,
      this.ffRef})
      : super._();

  @override
  QuizSetRecord rebuild(void Function(QuizSetRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizSetRecordBuilder toBuilder() => new QuizSetRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizSetRecord &&
        quizName == other.quizName &&
        duration == other.duration &&
        totalQuestions == other.totalQuestions &&
        description == other.description &&
        coverPhoto == other.coverPhoto &&
        userId == other.userId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quizName.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, totalQuestions.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, coverPhoto.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuizSetRecord')
          ..add('quizName', quizName)
          ..add('duration', duration)
          ..add('totalQuestions', totalQuestions)
          ..add('description', description)
          ..add('coverPhoto', coverPhoto)
          ..add('userId', userId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class QuizSetRecordBuilder
    implements Builder<QuizSetRecord, QuizSetRecordBuilder> {
  _$QuizSetRecord? _$v;

  String? _quizName;
  String? get quizName => _$this._quizName;
  set quizName(String? quizName) => _$this._quizName = quizName;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  int? _totalQuestions;
  int? get totalQuestions => _$this._totalQuestions;
  set totalQuestions(int? totalQuestions) =>
      _$this._totalQuestions = totalQuestions;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _coverPhoto;
  String? get coverPhoto => _$this._coverPhoto;
  set coverPhoto(String? coverPhoto) => _$this._coverPhoto = coverPhoto;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  QuizSetRecordBuilder() {
    QuizSetRecord._initializeBuilder(this);
  }

  QuizSetRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quizName = $v.quizName;
      _duration = $v.duration;
      _totalQuestions = $v.totalQuestions;
      _description = $v.description;
      _coverPhoto = $v.coverPhoto;
      _userId = $v.userId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizSetRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizSetRecord;
  }

  @override
  void update(void Function(QuizSetRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuizSetRecord build() => _build();

  _$QuizSetRecord _build() {
    final _$result = _$v ??
        new _$QuizSetRecord._(
            quizName: quizName,
            duration: duration,
            totalQuestions: totalQuestions,
            description: description,
            coverPhoto: coverPhoto,
            userId: userId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
