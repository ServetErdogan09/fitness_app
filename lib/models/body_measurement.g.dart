// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_measurement.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBodyMeasurementCollection on Isar {
  IsarCollection<BodyMeasurement> get bodyMeasurements => this.collection();
}

const BodyMeasurementSchema = CollectionSchema(
  name: r'BodyMeasurement',
  id: -9058319788105540477,
  properties: {
    r'agirlik': PropertySchema(
      id: 0,
      name: r'agirlik',
      type: IsarType.double,
    ),
    r'belCevresi': PropertySchema(
      id: 1,
      name: r'belCevresi',
      type: IsarType.double,
    ),
    r'boy': PropertySchema(
      id: 2,
      name: r'boy',
      type: IsarType.double,
    ),
    r'gogusCevresi': PropertySchema(
      id: 3,
      name: r'gogusCevresi',
      type: IsarType.double,
    ),
    r'kalcaCevresi': PropertySchema(
      id: 4,
      name: r'kalcaCevresi',
      type: IsarType.double,
    ),
    r'kasKutlesi': PropertySchema(
      id: 5,
      name: r'kasKutlesi',
      type: IsarType.double,
    ),
    r'kullaniciId': PropertySchema(
      id: 6,
      name: r'kullaniciId',
      type: IsarType.long,
    ),
    r'pazuCevresi': PropertySchema(
      id: 7,
      name: r'pazuCevresi',
      type: IsarType.double,
    ),
    r'tarih': PropertySchema(
      id: 8,
      name: r'tarih',
      type: IsarType.dateTime,
    ),
    r'vucutYuzdesi': PropertySchema(
      id: 9,
      name: r'vucutYuzdesi',
      type: IsarType.double,
    )
  },
  estimateSize: _bodyMeasurementEstimateSize,
  serialize: _bodyMeasurementSerialize,
  deserialize: _bodyMeasurementDeserialize,
  deserializeProp: _bodyMeasurementDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bodyMeasurementGetId,
  getLinks: _bodyMeasurementGetLinks,
  attach: _bodyMeasurementAttach,
  version: '3.1.0+1',
);

int _bodyMeasurementEstimateSize(
  BodyMeasurement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bodyMeasurementSerialize(
  BodyMeasurement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.agirlik);
  writer.writeDouble(offsets[1], object.belCevresi);
  writer.writeDouble(offsets[2], object.boy);
  writer.writeDouble(offsets[3], object.gogusCevresi);
  writer.writeDouble(offsets[4], object.kalcaCevresi);
  writer.writeDouble(offsets[5], object.kasKutlesi);
  writer.writeLong(offsets[6], object.kullaniciId);
  writer.writeDouble(offsets[7], object.pazuCevresi);
  writer.writeDateTime(offsets[8], object.tarih);
  writer.writeDouble(offsets[9], object.vucutYuzdesi);
}

BodyMeasurement _bodyMeasurementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BodyMeasurement();
  object.agirlik = reader.readDouble(offsets[0]);
  object.belCevresi = reader.readDoubleOrNull(offsets[1]);
  object.boy = reader.readDouble(offsets[2]);
  object.gogusCevresi = reader.readDoubleOrNull(offsets[3]);
  object.id = id;
  object.kalcaCevresi = reader.readDoubleOrNull(offsets[4]);
  object.kasKutlesi = reader.readDoubleOrNull(offsets[5]);
  object.kullaniciId = reader.readLong(offsets[6]);
  object.pazuCevresi = reader.readDoubleOrNull(offsets[7]);
  object.tarih = reader.readDateTime(offsets[8]);
  object.vucutYuzdesi = reader.readDoubleOrNull(offsets[9]);
  return object;
}

P _bodyMeasurementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bodyMeasurementGetId(BodyMeasurement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bodyMeasurementGetLinks(BodyMeasurement object) {
  return [];
}

void _bodyMeasurementAttach(
    IsarCollection<dynamic> col, Id id, BodyMeasurement object) {
  object.id = id;
}

extension BodyMeasurementQueryWhereSort
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QWhere> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BodyMeasurementQueryWhere
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QWhereClause> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BodyMeasurementQueryFilter
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QFilterCondition> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      agirlikEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'agirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      agirlikGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'agirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      agirlikLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'agirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      agirlikBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'agirlik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'belCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'belCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'belCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'belCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'belCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      belCevresiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'belCevresi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      boyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      boyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      boyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      boyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gogusCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gogusCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gogusCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gogusCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gogusCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      gogusCevresiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gogusCevresi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kalcaCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kalcaCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kalcaCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kalcaCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kalcaCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kalcaCevresiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kalcaCevresi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kasKutlesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kasKutlesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kasKutlesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kasKutlesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kasKutlesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kasKutlesiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kasKutlesi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kullaniciIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kullaniciIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kullaniciIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      kullaniciIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kullaniciId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pazuCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pazuCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pazuCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pazuCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pazuCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      pazuCevresiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pazuCevresi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      tarihEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      tarihGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      tarihLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      tarihBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tarih',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vucutYuzdesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vucutYuzdesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterFilterCondition>
      vucutYuzdesiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vucutYuzdesi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BodyMeasurementQueryObject
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QFilterCondition> {}

extension BodyMeasurementQueryLinks
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QFilterCondition> {}

extension BodyMeasurementQuerySortBy
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QSortBy> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> sortByAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agirlik', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByAgirlikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agirlik', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByBelCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> sortByBoy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boy', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> sortByBoyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boy', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByGogusCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gogusCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByGogusCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gogusCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKalcaCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalcaCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKalcaCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalcaCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKasKutlesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kasKutlesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKasKutlesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kasKutlesi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByPazuCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pazuCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByPazuCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pazuCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> sortByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vucutYuzdesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      sortByVucutYuzdesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vucutYuzdesi', Sort.desc);
    });
  }
}

extension BodyMeasurementQuerySortThenBy
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QSortThenBy> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenByAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agirlik', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByAgirlikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'agirlik', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByBelCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'belCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenByBoy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boy', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenByBoyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boy', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByGogusCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gogusCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByGogusCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gogusCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKalcaCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalcaCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKalcaCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalcaCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKasKutlesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kasKutlesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKasKutlesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kasKutlesi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByPazuCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pazuCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByPazuCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pazuCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy> thenByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vucutYuzdesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QAfterSortBy>
      thenByVucutYuzdesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vucutYuzdesi', Sort.desc);
    });
  }
}

extension BodyMeasurementQueryWhereDistinct
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct> {
  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'agirlik');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'belCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct> distinctByBoy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boy');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByGogusCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gogusCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByKalcaCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kalcaCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByKasKutlesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kasKutlesi');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kullaniciId');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByPazuCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pazuCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct> distinctByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tarih');
    });
  }

  QueryBuilder<BodyMeasurement, BodyMeasurement, QDistinct>
      distinctByVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vucutYuzdesi');
    });
  }
}

extension BodyMeasurementQueryProperty
    on QueryBuilder<BodyMeasurement, BodyMeasurement, QQueryProperty> {
  QueryBuilder<BodyMeasurement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BodyMeasurement, double, QQueryOperations> agirlikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'agirlik');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      belCevresiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'belCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, double, QQueryOperations> boyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boy');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      gogusCevresiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gogusCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      kalcaCevresiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kalcaCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      kasKutlesiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kasKutlesi');
    });
  }

  QueryBuilder<BodyMeasurement, int, QQueryOperations> kullaniciIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kullaniciId');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      pazuCevresiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pazuCevresi');
    });
  }

  QueryBuilder<BodyMeasurement, DateTime, QQueryOperations> tarihProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tarih');
    });
  }

  QueryBuilder<BodyMeasurement, double?, QQueryOperations>
      vucutYuzdesiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vucutYuzdesi');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBodyMeasurementGoalCollection on Isar {
  IsarCollection<BodyMeasurementGoal> get bodyMeasurementGoals =>
      this.collection();
}

const BodyMeasurementGoalSchema = CollectionSchema(
  name: r'BodyMeasurementGoal',
  id: 3852469051297558451,
  properties: {
    r'hedefAgirlik': PropertySchema(
      id: 0,
      name: r'hedefAgirlik',
      type: IsarType.double,
    ),
    r'hedefBelCevresi': PropertySchema(
      id: 1,
      name: r'hedefBelCevresi',
      type: IsarType.double,
    ),
    r'hedefVucutYuzdesi': PropertySchema(
      id: 2,
      name: r'hedefVucutYuzdesi',
      type: IsarType.double,
    ),
    r'kullaniciId': PropertySchema(
      id: 3,
      name: r'kullaniciId',
      type: IsarType.long,
    ),
    r'sonGuncellemeTarihi': PropertySchema(
      id: 4,
      name: r'sonGuncellemeTarihi',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bodyMeasurementGoalEstimateSize,
  serialize: _bodyMeasurementGoalSerialize,
  deserialize: _bodyMeasurementGoalDeserialize,
  deserializeProp: _bodyMeasurementGoalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bodyMeasurementGoalGetId,
  getLinks: _bodyMeasurementGoalGetLinks,
  attach: _bodyMeasurementGoalAttach,
  version: '3.1.0+1',
);

int _bodyMeasurementGoalEstimateSize(
  BodyMeasurementGoal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bodyMeasurementGoalSerialize(
  BodyMeasurementGoal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.hedefAgirlik);
  writer.writeDouble(offsets[1], object.hedefBelCevresi);
  writer.writeDouble(offsets[2], object.hedefVucutYuzdesi);
  writer.writeLong(offsets[3], object.kullaniciId);
  writer.writeDateTime(offsets[4], object.sonGuncellemeTarihi);
}

BodyMeasurementGoal _bodyMeasurementGoalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BodyMeasurementGoal();
  object.hedefAgirlik = reader.readDouble(offsets[0]);
  object.hedefBelCevresi = reader.readDoubleOrNull(offsets[1]);
  object.hedefVucutYuzdesi = reader.readDoubleOrNull(offsets[2]);
  object.id = id;
  object.kullaniciId = reader.readLong(offsets[3]);
  object.sonGuncellemeTarihi = reader.readDateTime(offsets[4]);
  return object;
}

P _bodyMeasurementGoalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bodyMeasurementGoalGetId(BodyMeasurementGoal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bodyMeasurementGoalGetLinks(
    BodyMeasurementGoal object) {
  return [];
}

void _bodyMeasurementGoalAttach(
    IsarCollection<dynamic> col, Id id, BodyMeasurementGoal object) {
  object.id = id;
}

extension BodyMeasurementGoalQueryWhereSort
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QWhere> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BodyMeasurementGoalQueryWhere
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QWhereClause> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BodyMeasurementGoalQueryFilter on QueryBuilder<BodyMeasurementGoal,
    BodyMeasurementGoal, QFilterCondition> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefAgirlikEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefAgirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefAgirlikGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefAgirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefAgirlikLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefAgirlik',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefAgirlikBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefAgirlik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hedefBelCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hedefBelCevresi',
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefBelCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefBelCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefBelCevresi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefBelCevresiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefBelCevresi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hedefVucutYuzdesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hedefVucutYuzdesi',
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefVucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefVucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefVucutYuzdesi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      hedefVucutYuzdesiBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefVucutYuzdesi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      kullaniciIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      kullaniciIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      kullaniciIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      kullaniciIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kullaniciId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      sonGuncellemeTarihiEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sonGuncellemeTarihi',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      sonGuncellemeTarihiGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sonGuncellemeTarihi',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      sonGuncellemeTarihiLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sonGuncellemeTarihi',
        value: value,
      ));
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterFilterCondition>
      sonGuncellemeTarihiBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sonGuncellemeTarihi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BodyMeasurementGoalQueryObject on QueryBuilder<BodyMeasurementGoal,
    BodyMeasurementGoal, QFilterCondition> {}

extension BodyMeasurementGoalQueryLinks on QueryBuilder<BodyMeasurementGoal,
    BodyMeasurementGoal, QFilterCondition> {}

extension BodyMeasurementGoalQuerySortBy
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QSortBy> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefAgirlik', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefAgirlikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefAgirlik', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefBelCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefBelCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefBelCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefVucutYuzdesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByHedefVucutYuzdesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefVucutYuzdesi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      sortBySonGuncellemeTarihiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.desc);
    });
  }
}

extension BodyMeasurementGoalQuerySortThenBy
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QSortThenBy> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefAgirlik', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefAgirlikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefAgirlik', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefBelCevresi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefBelCevresiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefBelCevresi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefVucutYuzdesi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByHedefVucutYuzdesiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefVucutYuzdesi', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.asc);
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QAfterSortBy>
      thenBySonGuncellemeTarihiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.desc);
    });
  }
}

extension BodyMeasurementGoalQueryWhereDistinct
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct> {
  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct>
      distinctByHedefAgirlik() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefAgirlik');
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct>
      distinctByHedefBelCevresi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefBelCevresi');
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct>
      distinctByHedefVucutYuzdesi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefVucutYuzdesi');
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct>
      distinctByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kullaniciId');
    });
  }

  QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QDistinct>
      distinctBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sonGuncellemeTarihi');
    });
  }
}

extension BodyMeasurementGoalQueryProperty
    on QueryBuilder<BodyMeasurementGoal, BodyMeasurementGoal, QQueryProperty> {
  QueryBuilder<BodyMeasurementGoal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BodyMeasurementGoal, double, QQueryOperations>
      hedefAgirlikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefAgirlik');
    });
  }

  QueryBuilder<BodyMeasurementGoal, double?, QQueryOperations>
      hedefBelCevresiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefBelCevresi');
    });
  }

  QueryBuilder<BodyMeasurementGoal, double?, QQueryOperations>
      hedefVucutYuzdesiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefVucutYuzdesi');
    });
  }

  QueryBuilder<BodyMeasurementGoal, int, QQueryOperations>
      kullaniciIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kullaniciId');
    });
  }

  QueryBuilder<BodyMeasurementGoal, DateTime, QQueryOperations>
      sonGuncellemeTarihiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sonGuncellemeTarihi');
    });
  }
}
