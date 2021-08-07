import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'habits_record.g.dart';

abstract class HabitsRecord
    implements Built<HabitsRecord, HabitsRecordBuilder> {
  static Serializer<HabitsRecord> get serializer => _$habitsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'edited_at')
  DateTime get editedAt;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'due_date')
  String get dueDate;

  @nullable
  DocumentReference get user;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HabitsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..dueDate = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('habits');

  static Stream<HabitsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HabitsRecord._();
  factory HabitsRecord([void Function(HabitsRecordBuilder) updates]) =
      _$HabitsRecord;

  static HabitsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createHabitsRecordData({
  String name,
  DateTime createdAt,
  DateTime editedAt,
  String description,
  String dueDate,
  DocumentReference user,
  String type,
}) =>
    serializers.toFirestore(
        HabitsRecord.serializer,
        HabitsRecord((h) => h
          ..name = name
          ..createdAt = createdAt
          ..editedAt = editedAt
          ..description = description
          ..dueDate = dueDate
          ..user = user
          ..type = type));
