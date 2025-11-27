// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMealCollection on Isar {
  IsarCollection<Meal> get meals => this.collection();
}

const MealSchema = CollectionSchema(
  name: r'Meal',
  id: 2462895270179255875,
  properties: {
    r'kullaniciId': PropertySchema(
      id: 0,
      name: r'kullaniciId',
      type: IsarType.long,
    ),
    r'ogunTuru': PropertySchema(
      id: 1,
      name: r'ogunTuru',
      type: IsarType.string,
    ),
    r'tarih': PropertySchema(
      id: 2,
      name: r'tarih',
      type: IsarType.dateTime,
    ),
    r'toplamKalori': PropertySchema(
      id: 3,
      name: r'toplamKalori',
      type: IsarType.double,
    ),
    r'toplamKarbonhidrat': PropertySchema(
      id: 4,
      name: r'toplamKarbonhidrat',
      type: IsarType.double,
    ),
    r'toplamProtein': PropertySchema(
      id: 5,
      name: r'toplamProtein',
      type: IsarType.double,
    ),
    r'toplamYag': PropertySchema(
      id: 6,
      name: r'toplamYag',
      type: IsarType.double,
    )
  },
  estimateSize: _mealEstimateSize,
  serialize: _mealSerialize,
  deserialize: _mealDeserialize,
  deserializeProp: _mealDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mealGetId,
  getLinks: _mealGetLinks,
  attach: _mealAttach,
  version: '3.1.0+1',
);

int _mealEstimateSize(
  Meal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ogunTuru.length * 3;
  return bytesCount;
}

void _mealSerialize(
  Meal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.kullaniciId);
  writer.writeString(offsets[1], object.ogunTuru);
  writer.writeDateTime(offsets[2], object.tarih);
  writer.writeDouble(offsets[3], object.toplamKalori);
  writer.writeDouble(offsets[4], object.toplamKarbonhidrat);
  writer.writeDouble(offsets[5], object.toplamProtein);
  writer.writeDouble(offsets[6], object.toplamYag);
}

Meal _mealDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Meal();
  object.id = id;
  object.kullaniciId = reader.readLong(offsets[0]);
  object.ogunTuru = reader.readString(offsets[1]);
  object.tarih = reader.readDateTime(offsets[2]);
  object.toplamKalori = reader.readDouble(offsets[3]);
  object.toplamKarbonhidrat = reader.readDouble(offsets[4]);
  object.toplamProtein = reader.readDouble(offsets[5]);
  object.toplamYag = reader.readDouble(offsets[6]);
  return object;
}

P _mealDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mealGetId(Meal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mealGetLinks(Meal object) {
  return [];
}

void _mealAttach(IsarCollection<dynamic> col, Id id, Meal object) {
  object.id = id;
}

extension MealQueryWhereSort on QueryBuilder<Meal, Meal, QWhere> {
  QueryBuilder<Meal, Meal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealQueryWhere on QueryBuilder<Meal, Meal, QWhereClause> {
  QueryBuilder<Meal, Meal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Meal, Meal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> idBetween(
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

extension MealQueryFilter on QueryBuilder<Meal, Meal, QFilterCondition> {
  QueryBuilder<Meal, Meal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> kullaniciIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> kullaniciIdGreaterThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> kullaniciIdLessThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> kullaniciIdBetween(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ogunTuru',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ogunTuru',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ogunTuru',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ogunTuru',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ogunTuruIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ogunTuru',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tarihEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tarihGreaterThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tarihLessThan(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tarihBetween(
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

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKaloriEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toplamKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKaloriGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toplamKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKaloriLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toplamKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKaloriBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toplamKalori',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKarbonhidratEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toplamKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKarbonhidratGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toplamKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKarbonhidratLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toplamKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamKarbonhidratBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toplamKarbonhidrat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toplamProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toplamProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toplamProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toplamProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamYagEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toplamYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamYagGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toplamYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamYagLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toplamYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> toplamYagBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toplamYag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MealQueryObject on QueryBuilder<Meal, Meal, QFilterCondition> {}

extension MealQueryLinks on QueryBuilder<Meal, Meal, QFilterCondition> {}

extension MealQuerySortBy on QueryBuilder<Meal, Meal, QSortBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> sortByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByOgunTuru() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ogunTuru', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByOgunTuruDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ogunTuru', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKalori', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKalori', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKarbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKarbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamProtein', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamProtein', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamYag', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByToplamYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamYag', Sort.desc);
    });
  }
}

extension MealQuerySortThenBy on QueryBuilder<Meal, Meal, QSortThenBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByOgunTuru() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ogunTuru', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByOgunTuruDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ogunTuru', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKalori', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKalori', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKarbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamKarbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamProtein', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamProtein', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamYag', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByToplamYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toplamYag', Sort.desc);
    });
  }
}

extension MealQueryWhereDistinct on QueryBuilder<Meal, Meal, QDistinct> {
  QueryBuilder<Meal, Meal, QDistinct> distinctByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kullaniciId');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByOgunTuru(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ogunTuru', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tarih');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByToplamKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toplamKalori');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByToplamKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toplamKarbonhidrat');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByToplamProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toplamProtein');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByToplamYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toplamYag');
    });
  }
}

extension MealQueryProperty on QueryBuilder<Meal, Meal, QQueryProperty> {
  QueryBuilder<Meal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Meal, int, QQueryOperations> kullaniciIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kullaniciId');
    });
  }

  QueryBuilder<Meal, String, QQueryOperations> ogunTuruProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ogunTuru');
    });
  }

  QueryBuilder<Meal, DateTime, QQueryOperations> tarihProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tarih');
    });
  }

  QueryBuilder<Meal, double, QQueryOperations> toplamKaloriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toplamKalori');
    });
  }

  QueryBuilder<Meal, double, QQueryOperations> toplamKarbonhidratProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toplamKarbonhidrat');
    });
  }

  QueryBuilder<Meal, double, QQueryOperations> toplamProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toplamProtein');
    });
  }

  QueryBuilder<Meal, double, QQueryOperations> toplamYagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toplamYag');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodEntryCollection on Isar {
  IsarCollection<FoodEntry> get foodEntrys => this.collection();
}

const FoodEntrySchema = CollectionSchema(
  name: r'FoodEntry',
  id: -3633015723928946904,
  properties: {
    r'kalori': PropertySchema(
      id: 0,
      name: r'kalori',
      type: IsarType.double,
    ),
    r'karbonhidrat': PropertySchema(
      id: 1,
      name: r'karbonhidrat',
      type: IsarType.double,
    ),
    r'porsiyonBirim': PropertySchema(
      id: 2,
      name: r'porsiyonBirim',
      type: IsarType.string,
    ),
    r'porsiyonMiktari': PropertySchema(
      id: 3,
      name: r'porsiyonMiktari',
      type: IsarType.double,
    ),
    r'protein': PropertySchema(
      id: 4,
      name: r'protein',
      type: IsarType.double,
    ),
    r'yag': PropertySchema(
      id: 5,
      name: r'yag',
      type: IsarType.double,
    ),
    r'yemekId': PropertySchema(
      id: 6,
      name: r'yemekId',
      type: IsarType.long,
    ),
    r'yiyecekAdi': PropertySchema(
      id: 7,
      name: r'yiyecekAdi',
      type: IsarType.string,
    )
  },
  estimateSize: _foodEntryEstimateSize,
  serialize: _foodEntrySerialize,
  deserialize: _foodEntryDeserialize,
  deserializeProp: _foodEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _foodEntryGetId,
  getLinks: _foodEntryGetLinks,
  attach: _foodEntryAttach,
  version: '3.1.0+1',
);

int _foodEntryEstimateSize(
  FoodEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.porsiyonBirim.length * 3;
  bytesCount += 3 + object.yiyecekAdi.length * 3;
  return bytesCount;
}

void _foodEntrySerialize(
  FoodEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.kalori);
  writer.writeDouble(offsets[1], object.karbonhidrat);
  writer.writeString(offsets[2], object.porsiyonBirim);
  writer.writeDouble(offsets[3], object.porsiyonMiktari);
  writer.writeDouble(offsets[4], object.protein);
  writer.writeDouble(offsets[5], object.yag);
  writer.writeLong(offsets[6], object.yemekId);
  writer.writeString(offsets[7], object.yiyecekAdi);
}

FoodEntry _foodEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodEntry();
  object.id = id;
  object.kalori = reader.readDouble(offsets[0]);
  object.karbonhidrat = reader.readDouble(offsets[1]);
  object.porsiyonBirim = reader.readString(offsets[2]);
  object.porsiyonMiktari = reader.readDouble(offsets[3]);
  object.protein = reader.readDouble(offsets[4]);
  object.yag = reader.readDouble(offsets[5]);
  object.yemekId = reader.readLong(offsets[6]);
  object.yiyecekAdi = reader.readString(offsets[7]);
  return object;
}

P _foodEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodEntryGetId(FoodEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodEntryGetLinks(FoodEntry object) {
  return [];
}

void _foodEntryAttach(IsarCollection<dynamic> col, Id id, FoodEntry object) {
  object.id = id;
}

extension FoodEntryQueryWhereSort
    on QueryBuilder<FoodEntry, FoodEntry, QWhere> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodEntryQueryWhere
    on QueryBuilder<FoodEntry, FoodEntry, QWhereClause> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterWhereClause> idBetween(
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

extension FoodEntryQueryFilter
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> kaloriEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> kaloriGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> kaloriLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> kaloriBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kalori',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> karbonhidratEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'karbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      karbonhidratGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'karbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      karbonhidratLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'karbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> karbonhidratBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'karbonhidrat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'porsiyonBirim',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'porsiyonBirim',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'porsiyonBirim',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porsiyonBirim',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonBirimIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'porsiyonBirim',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonMiktariEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'porsiyonMiktari',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonMiktariGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'porsiyonMiktari',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonMiktariLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'porsiyonMiktari',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      porsiyonMiktariBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'porsiyonMiktari',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> proteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yagEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yagGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yagLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yagBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yemekIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yemekId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yemekIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yemekId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yemekIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yemekId',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yemekIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yemekId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      yiyecekAdiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yiyecekAdi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      yiyecekAdiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'yiyecekAdi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition> yiyecekAdiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'yiyecekAdi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      yiyecekAdiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yiyecekAdi',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterFilterCondition>
      yiyecekAdiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'yiyecekAdi',
        value: '',
      ));
    });
  }
}

extension FoodEntryQueryObject
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {}

extension FoodEntryQueryLinks
    on QueryBuilder<FoodEntry, FoodEntry, QFilterCondition> {}

extension FoodEntryQuerySortBy on QueryBuilder<FoodEntry, FoodEntry, QSortBy> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalori', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalori', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'karbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'karbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPorsiyonBirim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonBirim', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPorsiyonBirimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonBirim', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPorsiyonMiktari() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonMiktari', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByPorsiyonMiktariDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonMiktari', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yag', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yag', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYemekId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yemekId', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYemekIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yemekId', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYiyecekAdi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yiyecekAdi', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> sortByYiyecekAdiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yiyecekAdi', Sort.desc);
    });
  }
}

extension FoodEntryQuerySortThenBy
    on QueryBuilder<FoodEntry, FoodEntry, QSortThenBy> {
  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalori', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kalori', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'karbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'karbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPorsiyonBirim() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonBirim', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPorsiyonBirimDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonBirim', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPorsiyonMiktari() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonMiktari', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByPorsiyonMiktariDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'porsiyonMiktari', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yag', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yag', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYemekId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yemekId', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYemekIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yemekId', Sort.desc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYiyecekAdi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yiyecekAdi', Sort.asc);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QAfterSortBy> thenByYiyecekAdiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yiyecekAdi', Sort.desc);
    });
  }
}

extension FoodEntryQueryWhereDistinct
    on QueryBuilder<FoodEntry, FoodEntry, QDistinct> {
  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kalori');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'karbonhidrat');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPorsiyonBirim(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'porsiyonBirim',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByPorsiyonMiktari() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'porsiyonMiktari');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yag');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByYemekId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yemekId');
    });
  }

  QueryBuilder<FoodEntry, FoodEntry, QDistinct> distinctByYiyecekAdi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yiyecekAdi', caseSensitive: caseSensitive);
    });
  }
}

extension FoodEntryQueryProperty
    on QueryBuilder<FoodEntry, FoodEntry, QQueryProperty> {
  QueryBuilder<FoodEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> kaloriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kalori');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> karbonhidratProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'karbonhidrat');
    });
  }

  QueryBuilder<FoodEntry, String, QQueryOperations> porsiyonBirimProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'porsiyonBirim');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> porsiyonMiktariProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'porsiyonMiktari');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }

  QueryBuilder<FoodEntry, double, QQueryOperations> yagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yag');
    });
  }

  QueryBuilder<FoodEntry, int, QQueryOperations> yemekIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yemekId');
    });
  }

  QueryBuilder<FoodEntry, String, QQueryOperations> yiyecekAdiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yiyecekAdi');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNutritionGoalCollection on Isar {
  IsarCollection<NutritionGoal> get nutritionGoals => this.collection();
}

const NutritionGoalSchema = CollectionSchema(
  name: r'NutritionGoal',
  id: -6176738821382431484,
  properties: {
    r'hedefKalori': PropertySchema(
      id: 0,
      name: r'hedefKalori',
      type: IsarType.double,
    ),
    r'hedefKarbonhidrat': PropertySchema(
      id: 1,
      name: r'hedefKarbonhidrat',
      type: IsarType.double,
    ),
    r'hedefProtein': PropertySchema(
      id: 2,
      name: r'hedefProtein',
      type: IsarType.double,
    ),
    r'hedefYag': PropertySchema(
      id: 3,
      name: r'hedefYag',
      type: IsarType.double,
    ),
    r'kullaniciId': PropertySchema(
      id: 4,
      name: r'kullaniciId',
      type: IsarType.long,
    ),
    r'sonGuncellemeTarihi': PropertySchema(
      id: 5,
      name: r'sonGuncellemeTarihi',
      type: IsarType.dateTime,
    ),
    r'tarih': PropertySchema(
      id: 6,
      name: r'tarih',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _nutritionGoalEstimateSize,
  serialize: _nutritionGoalSerialize,
  deserialize: _nutritionGoalDeserialize,
  deserializeProp: _nutritionGoalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _nutritionGoalGetId,
  getLinks: _nutritionGoalGetLinks,
  attach: _nutritionGoalAttach,
  version: '3.1.0+1',
);

int _nutritionGoalEstimateSize(
  NutritionGoal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _nutritionGoalSerialize(
  NutritionGoal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.hedefKalori);
  writer.writeDouble(offsets[1], object.hedefKarbonhidrat);
  writer.writeDouble(offsets[2], object.hedefProtein);
  writer.writeDouble(offsets[3], object.hedefYag);
  writer.writeLong(offsets[4], object.kullaniciId);
  writer.writeDateTime(offsets[5], object.sonGuncellemeTarihi);
  writer.writeDateTime(offsets[6], object.tarih);
}

NutritionGoal _nutritionGoalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionGoal();
  object.hedefKalori = reader.readDouble(offsets[0]);
  object.hedefKarbonhidrat = reader.readDouble(offsets[1]);
  object.hedefProtein = reader.readDouble(offsets[2]);
  object.hedefYag = reader.readDouble(offsets[3]);
  object.id = id;
  object.kullaniciId = reader.readLong(offsets[4]);
  object.sonGuncellemeTarihi = reader.readDateTime(offsets[5]);
  object.tarih = reader.readDateTime(offsets[6]);
  return object;
}

P _nutritionGoalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nutritionGoalGetId(NutritionGoal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nutritionGoalGetLinks(NutritionGoal object) {
  return [];
}

void _nutritionGoalAttach(
    IsarCollection<dynamic> col, Id id, NutritionGoal object) {
  object.id = id;
}

extension NutritionGoalQueryWhereSort
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhere> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NutritionGoalQueryWhere
    on QueryBuilder<NutritionGoal, NutritionGoal, QWhereClause> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterWhereClause> idBetween(
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

extension NutritionGoalQueryFilter
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKaloriEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKaloriGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKaloriLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefKalori',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKaloriBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefKalori',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKarbonhidratEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKarbonhidratGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKarbonhidratLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefKarbonhidrat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefKarbonhidratBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefKarbonhidrat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefProteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefProteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefProteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefProtein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefProteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefYagEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hedefYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefYagGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hedefYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefYagLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hedefYag',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      hedefYagBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hedefYag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      kullaniciIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kullaniciId',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      sonGuncellemeTarihiEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sonGuncellemeTarihi',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
      tarihEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tarih',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterFilterCondition>
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
}

extension NutritionGoalQueryObject
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQueryLinks
    on QueryBuilder<NutritionGoal, NutritionGoal, QFilterCondition> {}

extension NutritionGoalQuerySortBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByHedefKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKalori', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKalori', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKarbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKarbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByHedefYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefYag', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByHedefYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefYag', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      sortBySonGuncellemeTarihiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> sortByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }
}

extension NutritionGoalQuerySortThenBy
    on QueryBuilder<NutritionGoal, NutritionGoal, QSortThenBy> {
  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByHedefKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKalori', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefKaloriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKalori', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKarbonhidrat', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefKarbonhidratDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefKarbonhidrat', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefProtein', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefProtein', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByHedefYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefYag', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByHedefYagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hedefYag', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenByKullaniciIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kullaniciId', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy>
      thenBySonGuncellemeTarihiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sonGuncellemeTarihi', Sort.desc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.asc);
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QAfterSortBy> thenByTarihDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tarih', Sort.desc);
    });
  }
}

extension NutritionGoalQueryWhereDistinct
    on QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> {
  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByHedefKalori() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefKalori');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByHedefKarbonhidrat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefKarbonhidrat');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByHedefProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefProtein');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByHedefYag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hedefYag');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctByKullaniciId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kullaniciId');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct>
      distinctBySonGuncellemeTarihi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sonGuncellemeTarihi');
    });
  }

  QueryBuilder<NutritionGoal, NutritionGoal, QDistinct> distinctByTarih() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tarih');
    });
  }
}

extension NutritionGoalQueryProperty
    on QueryBuilder<NutritionGoal, NutritionGoal, QQueryProperty> {
  QueryBuilder<NutritionGoal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NutritionGoal, double, QQueryOperations> hedefKaloriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefKalori');
    });
  }

  QueryBuilder<NutritionGoal, double, QQueryOperations>
      hedefKarbonhidratProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefKarbonhidrat');
    });
  }

  QueryBuilder<NutritionGoal, double, QQueryOperations> hedefProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefProtein');
    });
  }

  QueryBuilder<NutritionGoal, double, QQueryOperations> hedefYagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hedefYag');
    });
  }

  QueryBuilder<NutritionGoal, int, QQueryOperations> kullaniciIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kullaniciId');
    });
  }

  QueryBuilder<NutritionGoal, DateTime, QQueryOperations>
      sonGuncellemeTarihiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sonGuncellemeTarihi');
    });
  }

  QueryBuilder<NutritionGoal, DateTime, QQueryOperations> tarihProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tarih');
    });
  }
}
