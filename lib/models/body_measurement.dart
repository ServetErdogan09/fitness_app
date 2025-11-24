import 'package:isar/isar.dart';

part 'body_measurement.g.dart';

// kullanıcıdan aldığımız bilgiler modeli
@collection
class BodyMeasurement {
  Id id = Isar.autoIncrement;
  late int kullaniciId;

  late DateTime tarih;
  late double agirlik; // kg
  late double boy; // cm olacak

  double? vucutYuzdesi;
  double? kasKutlesi;
  double? belCevresi;
  double? gogusCevresi;
  double? kalcaCevresi;
  double? pazuCevresi;
}

// ulaşmak istediği hedef  modelimiz
@collection
class BodyMeasurementGoal {
  Id id = Isar.autoIncrement;
  late int kullaniciId;

  late double hedefAgirlik;
  double? hedefVucutYuzdesi;
  double? hedefBelCevresi;
  late DateTime sonGuncellemeTarihi;
}
