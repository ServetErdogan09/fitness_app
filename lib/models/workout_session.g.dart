// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExerciseLogCollection on Isar {
  IsarCollection<ExerciseLog> get exerciseLogs => this.collection();
}

const ExerciseLogSchema = CollectionSchema(
  name: r'ExerciseLog',
  id: 6307021889001100190,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'exerciseName': PropertySchema(
      id: 1,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 2,
      name: r'notes',
      type: IsarType.string,
    ),
    r'orderIndex': PropertySchema(
      id: 3,
      name: r'orderIndex',
      type: IsarType.long,
    ),
    r'reps': PropertySchema(
      id: 4,
      name: r'reps',
      type: IsarType.long,
    ),
    r'sessionId': PropertySchema(
      id: 5,
      name: r'sessionId',
      type: IsarType.long,
    ),
    r'setNumber': PropertySchema(
      id: 6,
      name: r'setNumber',
      type: IsarType.long,
    ),
    r'weight': PropertySchema(
      id: 7,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _exerciseLogEstimateSize,
  serialize: _exerciseLogSerialize,
  deserialize: _exerciseLogDeserialize,
  deserializeProp: _exerciseLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _exerciseLogGetId,
  getLinks: _exerciseLogGetLinks,
  attach: _exerciseLogAttach,
  version: '3.1.0+1',
);

int _exerciseLogEstimateSize(
  ExerciseLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exerciseName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _exerciseLogSerialize(
  ExerciseLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.exerciseName);
  writer.writeString(offsets[2], object.notes);
  writer.writeLong(offsets[3], object.orderIndex);
  writer.writeLong(offsets[4], object.reps);
  writer.writeLong(offsets[5], object.sessionId);
  writer.writeLong(offsets[6], object.setNumber);
  writer.writeDouble(offsets[7], object.weight);
}

ExerciseLog _exerciseLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExerciseLog();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.exerciseName = reader.readString(offsets[1]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[2]);
  object.orderIndex = reader.readLongOrNull(offsets[3]);
  object.reps = reader.readLong(offsets[4]);
  object.sessionId = reader.readLong(offsets[5]);
  object.setNumber = reader.readLong(offsets[6]);
  object.weight = reader.readDouble(offsets[7]);
  return object;
}

P _exerciseLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _exerciseLogGetId(ExerciseLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _exerciseLogGetLinks(ExerciseLog object) {
  return [];
}

void _exerciseLogAttach(
    IsarCollection<dynamic> col, Id id, ExerciseLog object) {
  object.id = id;
}

extension ExerciseLogQueryWhereSort
    on QueryBuilder<ExerciseLog, ExerciseLog, QWhere> {
  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExerciseLogQueryWhere
    on QueryBuilder<ExerciseLog, ExerciseLog, QWhereClause> {
  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterWhereClause> idBetween(
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

extension ExerciseLogQueryFilter
    on QueryBuilder<ExerciseLog, ExerciseLog, QFilterCondition> {
  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderIndex',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderIndex',
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      orderIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> repsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> repsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> repsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reps',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> repsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      sessionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      sessionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      sessionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionId',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      sessionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      setNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      setNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      setNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      setNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> weightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition>
      weightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> weightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterFilterCondition> weightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ExerciseLogQueryObject
    on QueryBuilder<ExerciseLog, ExerciseLog, QFilterCondition> {}

extension ExerciseLogQueryLinks
    on QueryBuilder<ExerciseLog, ExerciseLog, QFilterCondition> {}

extension ExerciseLogQuerySortBy
    on QueryBuilder<ExerciseLog, ExerciseLog, QSortBy> {
  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortBySetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setNumber', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortBySetNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setNumber', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension ExerciseLogQuerySortThenBy
    on QueryBuilder<ExerciseLog, ExerciseLog, QSortThenBy> {
  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reps', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenBySetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setNumber', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenBySetNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setNumber', Sort.desc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension ExerciseLogQueryWhereDistinct
    on QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> {
  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByExerciseName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderIndex');
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reps');
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId');
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctBySetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'setNumber');
    });
  }

  QueryBuilder<ExerciseLog, ExerciseLog, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension ExerciseLogQueryProperty
    on QueryBuilder<ExerciseLog, ExerciseLog, QQueryProperty> {
  QueryBuilder<ExerciseLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExerciseLog, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<ExerciseLog, String, QQueryOperations> exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<ExerciseLog, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ExerciseLog, int?, QQueryOperations> orderIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderIndex');
    });
  }

  QueryBuilder<ExerciseLog, int, QQueryOperations> repsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reps');
    });
  }

  QueryBuilder<ExerciseLog, int, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<ExerciseLog, int, QQueryOperations> setNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setNumber');
    });
  }

  QueryBuilder<ExerciseLog, double, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutSessionCollection on Isar {
  IsarCollection<WorkoutSession> get workoutSessions => this.collection();
}

const WorkoutSessionSchema = CollectionSchema(
  name: r'WorkoutSession',
  id: 3465719098422617094,
  properties: {
    r'caloriesBurned': PropertySchema(
      id: 0,
      name: r'caloriesBurned',
      type: IsarType.double,
    ),
    r'duration': PropertySchema(
      id: 1,
      name: r'duration',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 2,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'sessionName': PropertySchema(
      id: 3,
      name: r'sessionName',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 4,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.long,
    ),
    r'workoutPlanId': PropertySchema(
      id: 6,
      name: r'workoutPlanId',
      type: IsarType.long,
    )
  },
  estimateSize: _workoutSessionEstimateSize,
  serialize: _workoutSessionSerialize,
  deserialize: _workoutSessionDeserialize,
  deserializeProp: _workoutSessionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workoutSessionGetId,
  getLinks: _workoutSessionGetLinks,
  attach: _workoutSessionAttach,
  version: '3.1.0+1',
);

int _workoutSessionEstimateSize(
  WorkoutSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.sessionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _workoutSessionSerialize(
  WorkoutSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.caloriesBurned);
  writer.writeLong(offsets[1], object.duration);
  writer.writeDateTime(offsets[2], object.endTime);
  writer.writeString(offsets[3], object.sessionName);
  writer.writeDateTime(offsets[4], object.startTime);
  writer.writeLong(offsets[5], object.userId);
  writer.writeLong(offsets[6], object.workoutPlanId);
}

WorkoutSession _workoutSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutSession();
  object.caloriesBurned = reader.readDoubleOrNull(offsets[0]);
  object.duration = reader.readLongOrNull(offsets[1]);
  object.endTime = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.sessionName = reader.readStringOrNull(offsets[3]);
  object.startTime = reader.readDateTime(offsets[4]);
  object.userId = reader.readLong(offsets[5]);
  object.workoutPlanId = reader.readLongOrNull(offsets[6]);
  return object;
}

P _workoutSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutSessionGetId(WorkoutSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutSessionGetLinks(WorkoutSession object) {
  return [];
}

void _workoutSessionAttach(
    IsarCollection<dynamic> col, Id id, WorkoutSession object) {
  object.id = id;
}

extension WorkoutSessionQueryWhereSort
    on QueryBuilder<WorkoutSession, WorkoutSession, QWhere> {
  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutSessionQueryWhere
    on QueryBuilder<WorkoutSession, WorkoutSession, QWhereClause> {
  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterWhereClause> idBetween(
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

extension WorkoutSessionQueryFilter
    on QueryBuilder<WorkoutSession, WorkoutSession, QFilterCondition> {
  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'caloriesBurned',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'caloriesBurned',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'caloriesBurned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      caloriesBurnedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'caloriesBurned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
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

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
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

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sessionName',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sessionName',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sessionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sessionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      sessionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workoutPlanId',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workoutPlanId',
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workoutPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workoutPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workoutPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterFilterCondition>
      workoutPlanIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workoutPlanId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutSessionQueryObject
    on QueryBuilder<WorkoutSession, WorkoutSession, QFilterCondition> {}

extension WorkoutSessionQueryLinks
    on QueryBuilder<WorkoutSession, WorkoutSession, QFilterCondition> {}

extension WorkoutSessionQuerySortBy
    on QueryBuilder<WorkoutSession, WorkoutSession, QSortBy> {
  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByCaloriesBurnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortBySessionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortBySessionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByWorkoutPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutPlanId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      sortByWorkoutPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutPlanId', Sort.desc);
    });
  }
}

extension WorkoutSessionQuerySortThenBy
    on QueryBuilder<WorkoutSession, WorkoutSession, QSortThenBy> {
  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByCaloriesBurnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'caloriesBurned', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenBySessionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenBySessionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByWorkoutPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutPlanId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QAfterSortBy>
      thenByWorkoutPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutPlanId', Sort.desc);
    });
  }
}

extension WorkoutSessionQueryWhereDistinct
    on QueryBuilder<WorkoutSession, WorkoutSession, QDistinct> {
  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct>
      distinctByCaloriesBurned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'caloriesBurned');
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct> distinctBySessionName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<WorkoutSession, WorkoutSession, QDistinct>
      distinctByWorkoutPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workoutPlanId');
    });
  }
}

extension WorkoutSessionQueryProperty
    on QueryBuilder<WorkoutSession, WorkoutSession, QQueryProperty> {
  QueryBuilder<WorkoutSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutSession, double?, QQueryOperations>
      caloriesBurnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'caloriesBurned');
    });
  }

  QueryBuilder<WorkoutSession, int?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<WorkoutSession, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<WorkoutSession, String?, QQueryOperations>
      sessionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionName');
    });
  }

  QueryBuilder<WorkoutSession, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<WorkoutSession, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<WorkoutSession, int?, QQueryOperations> workoutPlanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workoutPlanId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutPlanCollection on Isar {
  IsarCollection<WorkoutPlan> get workoutPlans => this.collection();
}

const WorkoutPlanSchema = CollectionSchema(
  name: r'WorkoutPlan',
  id: 313749700063086650,
  properties: {
    r'creationDate': PropertySchema(
      id: 0,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'days': PropertySchema(
      id: 1,
      name: r'days',
      type: IsarType.objectList,
      target: r'WorkoutDay',
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 3,
      name: r'difficulty',
      type: IsarType.string,
    ),
    r'estimatedDuration': PropertySchema(
      id: 4,
      name: r'estimatedDuration',
      type: IsarType.long,
    ),
    r'goal': PropertySchema(
      id: 5,
      name: r'goal',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'planName': PropertySchema(
      id: 7,
      name: r'planName',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _workoutPlanEstimateSize,
  serialize: _workoutPlanSerialize,
  deserialize: _workoutPlanDeserialize,
  deserializeProp: _workoutPlanDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'WorkoutDay': WorkoutDaySchema},
  getId: _workoutPlanGetId,
  getLinks: _workoutPlanGetLinks,
  attach: _workoutPlanAttach,
  version: '3.1.0+1',
);

int _workoutPlanEstimateSize(
  WorkoutPlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.days.length * 3;
  {
    final offsets = allOffsets[WorkoutDay]!;
    for (var i = 0; i < object.days.length; i++) {
      final value = object.days[i];
      bytesCount += WorkoutDaySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.difficulty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.goal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.planName.length * 3;
  return bytesCount;
}

void _workoutPlanSerialize(
  WorkoutPlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.creationDate);
  writer.writeObjectList<WorkoutDay>(
    offsets[1],
    allOffsets,
    WorkoutDaySchema.serialize,
    object.days,
  );
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.difficulty);
  writer.writeLong(offsets[4], object.estimatedDuration);
  writer.writeString(offsets[5], object.goal);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeString(offsets[7], object.planName);
  writer.writeLong(offsets[8], object.userId);
}

WorkoutPlan _workoutPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutPlan();
  object.creationDate = reader.readDateTime(offsets[0]);
  object.days = reader.readObjectList<WorkoutDay>(
        offsets[1],
        WorkoutDaySchema.deserialize,
        allOffsets,
        WorkoutDay(),
      ) ??
      [];
  object.description = reader.readStringOrNull(offsets[2]);
  object.difficulty = reader.readStringOrNull(offsets[3]);
  object.estimatedDuration = reader.readLongOrNull(offsets[4]);
  object.goal = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.isActive = reader.readBoolOrNull(offsets[6]);
  object.planName = reader.readString(offsets[7]);
  object.userId = reader.readLong(offsets[8]);
  return object;
}

P _workoutPlanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readObjectList<WorkoutDay>(
            offset,
            WorkoutDaySchema.deserialize,
            allOffsets,
            WorkoutDay(),
          ) ??
          []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutPlanGetId(WorkoutPlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutPlanGetLinks(WorkoutPlan object) {
  return [];
}

void _workoutPlanAttach(
    IsarCollection<dynamic> col, Id id, WorkoutPlan object) {
  object.id = id;
}

extension WorkoutPlanQueryWhereSort
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QWhere> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutPlanQueryWhere
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QWhereClause> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterWhereClause> idBetween(
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

extension WorkoutPlanQueryFilter
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      creationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      creationDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      creationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      daysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> daysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      daysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      daysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      daysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      daysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'difficulty',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'difficulty',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'difficulty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'difficulty',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedDuration',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedDuration',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      estimatedDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'goal',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      goalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'goal',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'goal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'goal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> goalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      goalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'goal',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> planNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> planNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'planName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> planNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'planName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      planNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'planName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkoutPlanQueryObject
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterFilterCondition> daysElement(
      FilterQuery<WorkoutDay> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'days');
    });
  }
}

extension WorkoutPlanQueryLinks
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QFilterCondition> {}

extension WorkoutPlanQuerySortBy
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QSortBy> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      sortByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      sortByEstimatedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension WorkoutPlanQuerySortThenBy
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QSortThenBy> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      thenByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy>
      thenByEstimatedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planName', Sort.desc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension WorkoutPlanQueryWhereDistinct
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> {
  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByDifficulty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct>
      distinctByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDuration');
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByGoal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByPlanName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkoutPlan, WorkoutPlan, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension WorkoutPlanQueryProperty
    on QueryBuilder<WorkoutPlan, WorkoutPlan, QQueryProperty> {
  QueryBuilder<WorkoutPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutPlan, DateTime, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<WorkoutPlan, List<WorkoutDay>, QQueryOperations> daysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'days');
    });
  }

  QueryBuilder<WorkoutPlan, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WorkoutPlan, String?, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<WorkoutPlan, int?, QQueryOperations>
      estimatedDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDuration');
    });
  }

  QueryBuilder<WorkoutPlan, String?, QQueryOperations> goalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goal');
    });
  }

  QueryBuilder<WorkoutPlan, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<WorkoutPlan, String, QQueryOperations> planNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planName');
    });
  }

  QueryBuilder<WorkoutPlan, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlanExerciseCollection on Isar {
  IsarCollection<PlanExercise> get planExercises => this.collection();
}

const PlanExerciseSchema = CollectionSchema(
  name: r'PlanExercise',
  id: 3851266672002900623,
  properties: {
    r'exerciseName': PropertySchema(
      id: 0,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 1,
      name: r'notes',
      type: IsarType.string,
    ),
    r'programId': PropertySchema(
      id: 2,
      name: r'programId',
      type: IsarType.long,
    ),
    r'repCount': PropertySchema(
      id: 3,
      name: r'repCount',
      type: IsarType.string,
    ),
    r'restTime': PropertySchema(
      id: 4,
      name: r'restTime',
      type: IsarType.long,
    ),
    r'setCount': PropertySchema(
      id: 5,
      name: r'setCount',
      type: IsarType.string,
    ),
    r'targetWeight': PropertySchema(
      id: 6,
      name: r'targetWeight',
      type: IsarType.double,
    )
  },
  estimateSize: _planExerciseEstimateSize,
  serialize: _planExerciseSerialize,
  deserialize: _planExerciseDeserialize,
  deserializeProp: _planExerciseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _planExerciseGetId,
  getLinks: _planExerciseGetLinks,
  attach: _planExerciseAttach,
  version: '3.1.0+1',
);

int _planExerciseEstimateSize(
  PlanExercise object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exerciseName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.repCount.length * 3;
  bytesCount += 3 + object.setCount.length * 3;
  return bytesCount;
}

void _planExerciseSerialize(
  PlanExercise object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.exerciseName);
  writer.writeString(offsets[1], object.notes);
  writer.writeLong(offsets[2], object.programId);
  writer.writeString(offsets[3], object.repCount);
  writer.writeLong(offsets[4], object.restTime);
  writer.writeString(offsets[5], object.setCount);
  writer.writeDouble(offsets[6], object.targetWeight);
}

PlanExercise _planExerciseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlanExercise();
  object.exerciseName = reader.readString(offsets[0]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[1]);
  object.programId = reader.readLong(offsets[2]);
  object.repCount = reader.readString(offsets[3]);
  object.restTime = reader.readLongOrNull(offsets[4]);
  object.setCount = reader.readString(offsets[5]);
  object.targetWeight = reader.readDoubleOrNull(offsets[6]);
  return object;
}

P _planExerciseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _planExerciseGetId(PlanExercise object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _planExerciseGetLinks(PlanExercise object) {
  return [];
}

void _planExerciseAttach(
    IsarCollection<dynamic> col, Id id, PlanExercise object) {
  object.id = id;
}

extension PlanExerciseQueryWhereSort
    on QueryBuilder<PlanExercise, PlanExercise, QWhere> {
  QueryBuilder<PlanExercise, PlanExercise, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlanExerciseQueryWhere
    on QueryBuilder<PlanExercise, PlanExercise, QWhereClause> {
  QueryBuilder<PlanExercise, PlanExercise, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<PlanExercise, PlanExercise, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterWhereClause> idBetween(
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

extension PlanExerciseQueryFilter
    on QueryBuilder<PlanExercise, PlanExercise, QFilterCondition> {
  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      programIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      programIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'programId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      programIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'programId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      programIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'programId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'repCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'repCount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repCount',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      repCountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'repCount',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'restTime',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'restTime',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      restTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'setCount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'setCount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setCount',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      setCountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'setCount',
        value: '',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetWeight',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetWeight',
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterFilterCondition>
      targetWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlanExerciseQueryObject
    on QueryBuilder<PlanExercise, PlanExercise, QFilterCondition> {}

extension PlanExerciseQueryLinks
    on QueryBuilder<PlanExercise, PlanExercise, QFilterCondition> {}

extension PlanExerciseQuerySortBy
    on QueryBuilder<PlanExercise, PlanExercise, QSortBy> {
  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByRepCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repCount', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByRepCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repCount', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortBySetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortBySetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> sortByTargetWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy>
      sortByTargetWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWeight', Sort.desc);
    });
  }
}

extension PlanExerciseQuerySortThenBy
    on QueryBuilder<PlanExercise, PlanExercise, QSortThenBy> {
  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByRepCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repCount', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByRepCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repCount', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenBySetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenBySetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'setCount', Sort.desc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy> thenByTargetWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWeight', Sort.asc);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QAfterSortBy>
      thenByTargetWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetWeight', Sort.desc);
    });
  }
}

extension PlanExerciseQueryWhereDistinct
    on QueryBuilder<PlanExercise, PlanExercise, QDistinct> {
  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByExerciseName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'programId');
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByRepCount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repCount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restTime');
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctBySetCount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'setCount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlanExercise, PlanExercise, QDistinct> distinctByTargetWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetWeight');
    });
  }
}

extension PlanExerciseQueryProperty
    on QueryBuilder<PlanExercise, PlanExercise, QQueryProperty> {
  QueryBuilder<PlanExercise, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlanExercise, String, QQueryOperations> exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<PlanExercise, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<PlanExercise, int, QQueryOperations> programIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'programId');
    });
  }

  QueryBuilder<PlanExercise, String, QQueryOperations> repCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repCount');
    });
  }

  QueryBuilder<PlanExercise, int?, QQueryOperations> restTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restTime');
    });
  }

  QueryBuilder<PlanExercise, String, QQueryOperations> setCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setCount');
    });
  }

  QueryBuilder<PlanExercise, double?, QQueryOperations> targetWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetWeight');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WorkoutDaySchema = Schema(
  name: r'WorkoutDay',
  id: -473137167238769109,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _workoutDayEstimateSize,
  serialize: _workoutDaySerialize,
  deserialize: _workoutDayDeserialize,
  deserializeProp: _workoutDayDeserializeProp,
);

int _workoutDayEstimateSize(
  WorkoutDay object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _workoutDaySerialize(
  WorkoutDay object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

WorkoutDay _workoutDayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutDay();
  object.name = reader.readString(offsets[0]);
  return object;
}

P _workoutDayDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WorkoutDayQueryFilter
    on QueryBuilder<WorkoutDay, WorkoutDay, QFilterCondition> {
  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkoutDay, WorkoutDay, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension WorkoutDayQueryObject
    on QueryBuilder<WorkoutDay, WorkoutDay, QFilterCondition> {}
