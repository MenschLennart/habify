// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HabitsRecord> _$habitsRecordSerializer =
    new _$HabitsRecordSerializer();

class _$HabitsRecordSerializer implements StructuredSerializer<HabitsRecord> {
  @override
  final Iterable<Type> types = const [HabitsRecord, _$HabitsRecord];
  @override
  final String wireName = 'HabitsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, HabitsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.editedAt;
    if (value != null) {
      result
        ..add('edited_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dueDate;
    if (value != null) {
      result
        ..add('due_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pinned;
    if (value != null) {
      result
        ..add('pinned')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  HabitsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HabitsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'edited_at':
          result.editedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'due_date':
          result.dueDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pinned':
          result.pinned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$HabitsRecord extends HabitsRecord {
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime editedAt;
  @override
  final String description;
  @override
  final String dueDate;
  @override
  final DocumentReference<Object> user;
  @override
  final String type;
  @override
  final bool pinned;
  @override
  final String icon;
  @override
  final DocumentReference<Object> reference;

  factory _$HabitsRecord([void Function(HabitsRecordBuilder) updates]) =>
      (new HabitsRecordBuilder()..update(updates)).build();

  _$HabitsRecord._(
      {this.name,
      this.createdAt,
      this.editedAt,
      this.description,
      this.dueDate,
      this.user,
      this.type,
      this.pinned,
      this.icon,
      this.reference})
      : super._();

  @override
  HabitsRecord rebuild(void Function(HabitsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HabitsRecordBuilder toBuilder() => new HabitsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HabitsRecord &&
        name == other.name &&
        createdAt == other.createdAt &&
        editedAt == other.editedAt &&
        description == other.description &&
        dueDate == other.dueDate &&
        user == other.user &&
        type == other.type &&
        pinned == other.pinned &&
        icon == other.icon &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, name.hashCode),
                                        createdAt.hashCode),
                                    editedAt.hashCode),
                                description.hashCode),
                            dueDate.hashCode),
                        user.hashCode),
                    type.hashCode),
                pinned.hashCode),
            icon.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HabitsRecord')
          ..add('name', name)
          ..add('createdAt', createdAt)
          ..add('editedAt', editedAt)
          ..add('description', description)
          ..add('dueDate', dueDate)
          ..add('user', user)
          ..add('type', type)
          ..add('pinned', pinned)
          ..add('icon', icon)
          ..add('reference', reference))
        .toString();
  }
}

class HabitsRecordBuilder
    implements Builder<HabitsRecord, HabitsRecordBuilder> {
  _$HabitsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DateTime _editedAt;
  DateTime get editedAt => _$this._editedAt;
  set editedAt(DateTime editedAt) => _$this._editedAt = editedAt;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _dueDate;
  String get dueDate => _$this._dueDate;
  set dueDate(String dueDate) => _$this._dueDate = dueDate;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _pinned;
  bool get pinned => _$this._pinned;
  set pinned(bool pinned) => _$this._pinned = pinned;

  String _icon;
  String get icon => _$this._icon;
  set icon(String icon) => _$this._icon = icon;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HabitsRecordBuilder() {
    HabitsRecord._initializeBuilder(this);
  }

  HabitsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _createdAt = $v.createdAt;
      _editedAt = $v.editedAt;
      _description = $v.description;
      _dueDate = $v.dueDate;
      _user = $v.user;
      _type = $v.type;
      _pinned = $v.pinned;
      _icon = $v.icon;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HabitsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HabitsRecord;
  }

  @override
  void update(void Function(HabitsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HabitsRecord build() {
    final _$result = _$v ??
        new _$HabitsRecord._(
            name: name,
            createdAt: createdAt,
            editedAt: editedAt,
            description: description,
            dueDate: dueDate,
            user: user,
            type: type,
            pinned: pinned,
            icon: icon,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
