// lib/models/nutrition.dart
import 'package:isar/isar.dart';

part 'nutrition.g.dart';

// yiycek verileri modeli
@collection
class Meal {
  Id id = Isar.autoIncrement;
  late int kullaniciId;

  late DateTime tarih;
  late String ogunTuru;

  late double toplamKalori;
  late double toplamKarbonhidrat;
  late double toplamProtein;
  late double toplamYag;
}

@collection
class FoodEntry {
  Id id = Isar.autoIncrement;
  late int yemekId;

  late String yiyecekAdi;
  late double porsiyonMiktari;
  late String porsiyonBirim;

  late double kalori;
  late double karbonhidrat;
  late double protein;
  late double yag;
}

// Beslenme hedefi modeli
@collection
class NutritionGoal {
  Id id = Isar.autoIncrement;
  late int kullaniciId;

  late double hedefKalori;
  late double hedefKarbonhidrat;
  late double hedefProtein;
  late double hedefYag;
  late DateTime sonGuncellemeTarihi;
}
