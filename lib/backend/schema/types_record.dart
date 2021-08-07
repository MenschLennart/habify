import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'types_record.g.dart';

abstract class TypesRecord implements Built<TypesRecord, TypesRecordBuilder> {
  static Serializer<TypesRecord> get serializer => _$typesRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TypesRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('types');

  static Stream<TypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TypesRecord._();
  factory TypesRecord([void Function(TypesRecordBuilder) updates]) =
      _$TypesRecord;

  static TypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTypesRecordData({
  String name,
}) =>
    serializers.toFirestore(
        TypesRecord.serializer, TypesRecord((t) => t..name = name));
