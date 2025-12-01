// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserPointsCollection on Isar {
  IsarCollection<UserPoints> get userPoints => this.collection();
}

const UserPointsSchema = CollectionSchema(
  name: r'UserPoints',
  id: 8269044073786646179,
  properties: {
    r'currentBadge': PropertySchema(
      id: 0,
      name: r'currentBadge',
      type: IsarType.string,
    ),
    r'currentLevel': PropertySchema(
      id: 1,
      name: r'currentLevel',
      type: IsarType.long,
    ),
    r'lastUpdated': PropertySchema(
      id: 2,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'monthStartDate': PropertySchema(
      id: 3,
      name: r'monthStartDate',
      type: IsarType.dateTime,
    ),
    r'monthlyPoints': PropertySchema(
      id: 4,
      name: r'monthlyPoints',
      type: IsarType.long,
    ),
    r'totalPoints': PropertySchema(
      id: 5,
      name: r'totalPoints',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(id: 6, name: r'userId', type: IsarType.long),
    r'weekStartDate': PropertySchema(
      id: 7,
      name: r'weekStartDate',
      type: IsarType.dateTime,
    ),
    r'weeklyPoints': PropertySchema(
      id: 8,
      name: r'weeklyPoints',
      type: IsarType.long,
    ),
  },
  estimateSize: _userPointsEstimateSize,
  serialize: _userPointsSerialize,
  deserialize: _userPointsDeserialize,
  deserializeProp: _userPointsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userPointsGetId,
  getLinks: _userPointsGetLinks,
  attach: _userPointsAttach,
  version: '3.1.0+1',
);

int _userPointsEstimateSize(
  UserPoints object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currentBadge;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userPointsSerialize(
  UserPoints object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currentBadge);
  writer.writeLong(offsets[1], object.currentLevel);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeDateTime(offsets[3], object.monthStartDate);
  writer.writeLong(offsets[4], object.monthlyPoints);
  writer.writeLong(offsets[5], object.totalPoints);
  writer.writeLong(offsets[6], object.userId);
  writer.writeDateTime(offsets[7], object.weekStartDate);
  writer.writeLong(offsets[8], object.weeklyPoints);
}

UserPoints _userPointsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPoints();
  object.currentBadge = reader.readStringOrNull(offsets[0]);
  object.currentLevel = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[2]);
  object.monthStartDate = reader.readDateTimeOrNull(offsets[3]);
  object.monthlyPoints = reader.readLong(offsets[4]);
  object.totalPoints = reader.readLong(offsets[5]);
  object.userId = reader.readLong(offsets[6]);
  object.weekStartDate = reader.readDateTimeOrNull(offsets[7]);
  object.weeklyPoints = reader.readLong(offsets[8]);
  return object;
}

P _userPointsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userPointsGetId(UserPoints object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userPointsGetLinks(UserPoints object) {
  return [];
}

void _userPointsAttach(IsarCollection<dynamic> col, Id id, UserPoints object) {
  object.id = id;
}

extension UserPointsQueryWhereSort
    on QueryBuilder<UserPoints, UserPoints, QWhere> {
  QueryBuilder<UserPoints, UserPoints, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserPointsQueryWhere
    on QueryBuilder<UserPoints, UserPoints, QWhereClause> {
  QueryBuilder<UserPoints, UserPoints, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserPoints, UserPoints, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserPointsQueryFilter
    on QueryBuilder<UserPoints, UserPoints, QFilterCondition> {
  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentBadge'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentBadge'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentBadge',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currentBadge',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currentBadge',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentBadge', value: ''),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentBadgeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currentBadge', value: ''),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentLevel'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentLevel'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentLevel', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  currentLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  lastUpdatedGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  lastUpdatedLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'monthStartDate'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'monthStartDate'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'monthStartDate', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'monthStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'monthStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'monthStartDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthlyPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'monthlyPoints', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthlyPointsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'monthlyPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthlyPointsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'monthlyPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  monthlyPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'monthlyPoints',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  totalPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalPoints', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  totalPointsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  totalPointsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  totalPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalPoints',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> userIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weekStartDate'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weekStartDate'),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weekStartDate', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weekStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weekStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weekStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weekStartDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weeklyPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weeklyPoints', value: value),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weeklyPointsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weeklyPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weeklyPointsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weeklyPoints',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterFilterCondition>
  weeklyPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weeklyPoints',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserPointsQueryObject
    on QueryBuilder<UserPoints, UserPoints, QFilterCondition> {}

extension UserPointsQueryLinks
    on QueryBuilder<UserPoints, UserPoints, QFilterCondition> {}

extension UserPointsQuerySortBy
    on QueryBuilder<UserPoints, UserPoints, QSortBy> {
  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByCurrentBadge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBadge', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByCurrentBadgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBadge', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByMonthStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy>
  sortByMonthStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByMonthlyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByMonthlyPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPoints', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByTotalPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByTotalPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPoints', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByWeekStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByWeeklyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> sortByWeeklyPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyPoints', Sort.desc);
    });
  }
}

extension UserPointsQuerySortThenBy
    on QueryBuilder<UserPoints, UserPoints, QSortThenBy> {
  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByCurrentBadge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBadge', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByCurrentBadgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBadge', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByMonthStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy>
  thenByMonthStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByMonthlyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByMonthlyPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyPoints', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByTotalPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByTotalPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPoints', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByWeekStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByWeeklyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyPoints', Sort.asc);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QAfterSortBy> thenByWeeklyPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyPoints', Sort.desc);
    });
  }
}

extension UserPointsQueryWhereDistinct
    on QueryBuilder<UserPoints, UserPoints, QDistinct> {
  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByCurrentBadge({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentBadge', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLevel');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByMonthStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthStartDate');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByMonthlyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyPoints');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByTotalPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPoints');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStartDate');
    });
  }

  QueryBuilder<UserPoints, UserPoints, QDistinct> distinctByWeeklyPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weeklyPoints');
    });
  }
}

extension UserPointsQueryProperty
    on QueryBuilder<UserPoints, UserPoints, QQueryProperty> {
  QueryBuilder<UserPoints, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserPoints, String?, QQueryOperations> currentBadgeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentBadge');
    });
  }

  QueryBuilder<UserPoints, int?, QQueryOperations> currentLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLevel');
    });
  }

  QueryBuilder<UserPoints, DateTime, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<UserPoints, DateTime?, QQueryOperations>
  monthStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthStartDate');
    });
  }

  QueryBuilder<UserPoints, int, QQueryOperations> monthlyPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyPoints');
    });
  }

  QueryBuilder<UserPoints, int, QQueryOperations> totalPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPoints');
    });
  }

  QueryBuilder<UserPoints, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<UserPoints, DateTime?, QQueryOperations>
  weekStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStartDate');
    });
  }

  QueryBuilder<UserPoints, int, QQueryOperations> weeklyPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weeklyPoints');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPointsHistoryCollection on Isar {
  IsarCollection<PointsHistory> get pointsHistorys => this.collection();
}

const PointsHistorySchema = CollectionSchema(
  name: r'PointsHistory',
  id: -7816986705326701936,
  properties: {
    r'details': PropertySchema(id: 0, name: r'details', type: IsarType.string),
    r'earnedAt': PropertySchema(
      id: 1,
      name: r'earnedAt',
      type: IsarType.dateTime,
    ),
    r'pointsEarned': PropertySchema(
      id: 2,
      name: r'pointsEarned',
      type: IsarType.long,
    ),
    r'reason': PropertySchema(id: 3, name: r'reason', type: IsarType.string),
    r'sessionId': PropertySchema(
      id: 4,
      name: r'sessionId',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(id: 5, name: r'userId', type: IsarType.long),
    r'userIdIndex': PropertySchema(
      id: 6,
      name: r'userIdIndex',
      type: IsarType.long,
    ),
  },
  estimateSize: _pointsHistoryEstimateSize,
  serialize: _pointsHistorySerialize,
  deserialize: _pointsHistoryDeserialize,
  deserializeProp: _pointsHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'userIdIndex_earnedAt': IndexSchema(
      id: 1731331872013838903,
      name: r'userIdIndex_earnedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userIdIndex',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'earnedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},
  getId: _pointsHistoryGetId,
  getLinks: _pointsHistoryGetLinks,
  attach: _pointsHistoryAttach,
  version: '3.1.0+1',
);

int _pointsHistoryEstimateSize(
  PointsHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.details;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reason.length * 3;
  return bytesCount;
}

void _pointsHistorySerialize(
  PointsHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.details);
  writer.writeDateTime(offsets[1], object.earnedAt);
  writer.writeLong(offsets[2], object.pointsEarned);
  writer.writeString(offsets[3], object.reason);
  writer.writeLong(offsets[4], object.sessionId);
  writer.writeLong(offsets[5], object.userId);
  writer.writeLong(offsets[6], object.userIdIndex);
}

PointsHistory _pointsHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PointsHistory();
  object.details = reader.readStringOrNull(offsets[0]);
  object.earnedAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.pointsEarned = reader.readLong(offsets[2]);
  object.reason = reader.readString(offsets[3]);
  object.sessionId = reader.readLong(offsets[4]);
  object.userId = reader.readLong(offsets[5]);
  return object;
}

P _pointsHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pointsHistoryGetId(PointsHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pointsHistoryGetLinks(PointsHistory object) {
  return [];
}

void _pointsHistoryAttach(
  IsarCollection<dynamic> col,
  Id id,
  PointsHistory object,
) {
  object.id = id;
}

extension PointsHistoryQueryWhereSort
    on QueryBuilder<PointsHistory, PointsHistory, QWhere> {
  QueryBuilder<PointsHistory, PointsHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhere>
  anyUserIdIndexEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userIdIndex_earnedAt'),
      );
    });
  }
}

extension PointsHistoryQueryWhere
    on QueryBuilder<PointsHistory, PointsHistory, QWhereClause> {
  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEqualToAnyEarnedAt(int userIdIndex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'userIdIndex_earnedAt',
          value: [userIdIndex],
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexNotEqualToAnyEarnedAt(int userIdIndex) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [],
                upper: [userIdIndex],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [],
                upper: [userIdIndex],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexGreaterThanAnyEarnedAt(int userIdIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [userIdIndex],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexLessThanAnyEarnedAt(int userIdIndex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [],
          upper: [userIdIndex],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexBetweenAnyEarnedAt(
    int lowerUserIdIndex,
    int upperUserIdIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [lowerUserIdIndex],
          includeLower: includeLower,
          upper: [upperUserIdIndex],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEarnedAtEqualTo(int userIdIndex, DateTime earnedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'userIdIndex_earnedAt',
          value: [userIdIndex, earnedAt],
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEqualToEarnedAtNotEqualTo(int userIdIndex, DateTime earnedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex],
                upper: [userIdIndex, earnedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex, earnedAt],
                includeLower: false,
                upper: [userIdIndex],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex, earnedAt],
                includeLower: false,
                upper: [userIdIndex],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userIdIndex_earnedAt',
                lower: [userIdIndex],
                upper: [userIdIndex, earnedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEqualToEarnedAtGreaterThan(
    int userIdIndex,
    DateTime earnedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [userIdIndex, earnedAt],
          includeLower: include,
          upper: [userIdIndex],
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEqualToEarnedAtLessThan(
    int userIdIndex,
    DateTime earnedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [userIdIndex],
          upper: [userIdIndex, earnedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterWhereClause>
  userIdIndexEqualToEarnedAtBetween(
    int userIdIndex,
    DateTime lowerEarnedAt,
    DateTime upperEarnedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userIdIndex_earnedAt',
          lower: [userIdIndex, lowerEarnedAt],
          includeLower: includeLower,
          upper: [userIdIndex, upperEarnedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PointsHistoryQueryFilter
    on QueryBuilder<PointsHistory, PointsHistory, QFilterCondition> {
  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'details'),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'details'),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'details',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'details',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'details',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'details', value: ''),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'details', value: ''),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  earnedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'earnedAt', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  earnedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'earnedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  earnedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'earnedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  earnedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'earnedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  pointsEarnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pointsEarned', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  pointsEarnedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pointsEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  pointsEarnedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pointsEarned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  pointsEarnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pointsEarned',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reason',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reason',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reason',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reason', value: ''),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  sessionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionId', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  sessionIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sessionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  sessionIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sessionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  sessionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sessionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userIdIndex', value: value),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userIdIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userIdIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterFilterCondition>
  userIdIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userIdIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PointsHistoryQueryObject
    on QueryBuilder<PointsHistory, PointsHistory, QFilterCondition> {}

extension PointsHistoryQueryLinks
    on QueryBuilder<PointsHistory, PointsHistory, QFilterCondition> {}

extension PointsHistoryQuerySortBy
    on QueryBuilder<PointsHistory, PointsHistory, QSortBy> {
  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  sortByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  sortByPointsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointsEarned', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  sortByPointsEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointsEarned', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> sortByUserIdIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIdIndex', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  sortByUserIdIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIdIndex', Sort.desc);
    });
  }
}

extension PointsHistoryQuerySortThenBy
    on QueryBuilder<PointsHistory, PointsHistory, QSortThenBy> {
  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  thenByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  thenByPointsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointsEarned', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  thenByPointsEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointsEarned', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy> thenByUserIdIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIdIndex', Sort.asc);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QAfterSortBy>
  thenByUserIdIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userIdIndex', Sort.desc);
    });
  }
}

extension PointsHistoryQueryWhereDistinct
    on QueryBuilder<PointsHistory, PointsHistory, QDistinct> {
  QueryBuilder<PointsHistory, PointsHistory, QDistinct> distinctByDetails({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'details', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct> distinctByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earnedAt');
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct>
  distinctByPointsEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pointsEarned');
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct> distinctByReason({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct> distinctBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId');
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<PointsHistory, PointsHistory, QDistinct>
  distinctByUserIdIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userIdIndex');
    });
  }
}

extension PointsHistoryQueryProperty
    on QueryBuilder<PointsHistory, PointsHistory, QQueryProperty> {
  QueryBuilder<PointsHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PointsHistory, String?, QQueryOperations> detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'details');
    });
  }

  QueryBuilder<PointsHistory, DateTime, QQueryOperations> earnedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earnedAt');
    });
  }

  QueryBuilder<PointsHistory, int, QQueryOperations> pointsEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pointsEarned');
    });
  }

  QueryBuilder<PointsHistory, String, QQueryOperations> reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<PointsHistory, int, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<PointsHistory, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<PointsHistory, int, QQueryOperations> userIdIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userIdIndex');
    });
  }
}
