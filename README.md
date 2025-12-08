# 💪 Fitness Tracker App

Modern ve kullanıcı dostu bir fitness takip uygulaması. Antrenman programlarınızı yönetin, beslenmenizi takip edin ve gelişiminizi detaylı analizlerle izleyin.

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📱 Özellikler

### 🏋️ Antrenman Takibi
- **Özel Antrenman Programları**: Kendi antrenman programlarınızı oluşturun ve yönetin
- **Egzersiz Kütüphanesi**: Geniş egzersiz veritabanı ile çalışmalarınızı kaydedin
- **Aktif Antrenman Modu**: Gerçek zamanlı antrenman takibi ve set/tekrar yönetimi
- **Takvim Görünümü**: Antrenmanlarınızı takvim üzerinde görselleştirin
- **İlerleme Takibi**: Hacim, ağırlık ve performans gelişimini grafik ve istatistiklerle izleyin

### 🥗 Beslenme Takibi
- **Günlük Kalori Takibi**: Tükettiğiniz kalorileri kaydedin ve hedeflerinize göre takip edin
- **Makro Besin Takibi**: Protein, karbonhidrat ve yağ dengesi
- **Öğün Yönetimi**: Kahvaltı, öğle, akşam ve ara öğünler için ayrı takip
- **Besin Geçmişi**: Geçmiş beslenme kayıtlarınıza kolayca erişin

### 📊 Vücut Ölçümleri
- **Kapsamlı Ölçüm Sistemi**: Kilo, boy, vücut yağ oranı, kas kütlesi ve daha fazlası
- **Çevre Ölçümleri**: Göğüs, bel, kalça, kol, bacak ölçümlerini takip edin
- **İlerleme Grafikleri**: Ölçümlerinizi zaman içinde görselleştirin
- **Vücut Kompozisyonu Hesaplayıcı**: BMI, vücut yağ oranı ve ideal kilo hesaplamaları

### 🎯 Puan Sistemi
- **Motivasyon Puanları**: Antrenman ve beslenme hedeflerinize ulaştıkça puan kazanın
- **Günlük Hedefler**: Günlük aktivite ve beslenme hedeflerinizi takip edin
- **Başarı Takibi**: İlerleyişinizi puan sistemi ile ölçün

### 📈 Analiz ve Raporlama
- **Detaylı İstatistikler**: Haftalık, aylık ve çeyrek dönemlik analizler
- **Keşfet Sekmesi**: Program bazlı detaylı analitikler
- **Hacim Takibi**: Toplam antrenman hacmi ve ilerleme grafikleri
- **En Çok Yapılan Egzersizler**: Favori egzersizlerinizi ve performansınızı görün

### 🎨 Kullanıcı Deneyimi
- **Modern ve Şık Tasarım**: Kullanıcı dostu arayüz
- **Türkçe Dil Desteği**: Tam Türkçe yerelleştirme
- **Özel Font**: LexendExa font ailesi ile profesyonel görünüm
- **Responsive Tasarım**: Tüm ekran boyutlarına uyumlu

## 🏗️ Mimari

Uygulama, modern Flutter best practice'lerine uygun olarak geliştirilmiştir:

```
lib/
├── config/              # Uygulama konfigürasyonları
├── core/                # Temel servisler ve yardımcı sınıflar
│   ├── extensions/      # Dart extension'ları
│   ├── providers/       # Riverpod provider'ları
│   ├── services/        # Veritabanı ve diğer servisler
│   └── utils/           # Yardımcı fonksiyonlar
├── features/            # Özellik bazlı modüller
│   ├── dashboard/       # Ana sayfa
│   ├── nutrition/       # Beslenme modülü
│   ├── profile/         # Profil ve ayarlar
│   ├── tracking/        # Takip ve analiz modülü
│   └── workouts/        # Antrenman modülü
├── models/              # Veri modelleri (Isar)
├── navigation/          # Navigasyon yapılandırması
└── router/              # Routing yönetimi
```

## 🛠️ Teknolojiler

### State Management
- **Flutter Riverpod** (2.6.1): Modern ve güçlü state management
- **Provider** (6.1.5): Ek state yönetimi desteği

### Veritabanı
- **Isar** (3.1.0): Yüksek performanslı NoSQL veritabanı
- **Path Provider** (2.1.5): Dosya sistemi erişimi

### UI/UX
- **FL Chart** (0.69.0): Güçlü grafik ve chart kütüphanesi
- **Flutter Slidable** (3.1.0): Kaydırılabilir liste öğeleri
- **Intl** (0.18.1): Uluslararasılaştırma ve tarih formatlama

### Navigasyon
- **Go Router** (17.0.0): Deklaratif routing
- **Get It** (9.1.0): Dependency injection

## 📋 Gereksinimler

- Flutter SDK: `^3.9.2`
- Dart SDK: `^3.9.2`
- iOS 12.0+ / Android 5.0+ (API 21+)

## 🚀 Kurulum

### 1. Projeyi Klonlayın

```bash
git clone https://github.com/ServetErdogan09/fitness_app.git
cd fitness_app
```

### 2. Bağımlılıkları Yükleyin

```bash
flutter pub get
```

### 3. Isar Code Generation

Veritabanı modellerini oluşturmak için:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Uygulamayı Çalıştırın

```bash
flutter run
```

## 📱 Desteklenen Platformlar

- ✅ Android
- ✅ iOS
- ✅ Web (deneysel)

## 🎯 Kullanım

### İlk Kurulum

1. Uygulamayı açın
2. Profil sekmesinden kişisel bilgilerinizi girin
3. Vücut ölçümlerinizi ekleyin
4. Günlük hedeflerinizi belirleyin

### Antrenman Ekleme

1. **Tracking** sekmesine gidin
2. **Antrenman** bölümünden yeni program oluşturun
3. Egzersizleri ekleyin ve set/tekrar bilgilerini girin
4. Aktif antrenman modunda çalışmanızı kaydedin

### Beslenme Takibi

1. **Tracking** sekmesinden **Beslenme** bölümüne gidin
2. Öğün seçin (Kahvaltı, Öğle, Akşam, Ara Öğün)
3. Besin bilgilerini girin
4. Günlük kalori ve makro hedeflerinizi takip edin

### Vücut Ölçümleri

1. **Profil** sekmesine gidin
2. **Vücut Ölçümleri** bölümünden yeni ölçüm ekleyin
3. İlerlemenizi grafiklerle görüntüleyin

## 📊 Veri Modelleri

### WorkoutSession
Antrenman seanslarını ve egzersiz detaylarını saklar.

### Nutrition
Günlük beslenme kayıtlarını ve makro besin değerlerini tutar.

### BodyMeasurement
Vücut ölçümlerini ve kompozisyon verilerini kaydeder.

### UserPoints
Kullanıcı puan sistemini ve günlük hedefleri yönetir.

## 🔧 Geliştirme

### Debug Modu

```bash
flutter run --debug
```

### Release Build

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

### Test

```bash
flutter test
```

### Code Generation (Isar Models)

Model değişikliklerinden sonra:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch mode için:

```bash
flutter pub run build_runner watch
```

## 🎨 Özelleştirme

### Tema Renkleri

Tema renklerini `lib/config/` klasöründeki dosyalardan özelleştirebilirsiniz.

### Font Değiştirme

`pubspec.yaml` dosyasındaki font tanımlamalarını düzenleyin:

```yaml
fonts:
  - family: YourFont
    fonts:
      - asset: assets/fonts/YourFont-Regular.ttf
```

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen şu adımları izleyin:

1. Projeyi fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

### Commit Mesaj Formatı

Conventional Commits standardını kullanıyoruz:

- `feat:` Yeni özellik
- `fix:` Bug düzeltmesi
- `docs:` Dokümantasyon değişiklikleri
- `style:` Kod formatı değişiklikleri
- `refactor:` Kod refactoring
- `test:` Test ekleme/düzeltme
- `chore:` Build process veya yardımcı araç değişiklikleri

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 👨‍💻 Geliştirici

**Servet Erdoğan**

- GitHub: [@ServetErdogan09](https://github.com/ServetErdogan09)
- Email: [İletişim için GitHub profilinden ulaşabilirsiniz]

## 🙏 Teşekkürler

Bu proje aşağıdaki harika açık kaynak paketleri kullanmaktadır:

- [Flutter](https://flutter.dev)
- [Isar Database](https://isar.dev)
- [Riverpod](https://riverpod.dev)
- [FL Chart](https://github.com/imaNNeo/fl_chart)
- [Go Router](https://pub.dev/packages/go_router)

## 📸 Ekran Görüntüleri

> Ekran görüntüleri yakında eklenecektir

## 🗺️ Roadmap

- [ ] Sosyal özellikler (arkadaş ekleme, antrenman paylaşma)
- [ ] Besin veritabanı entegrasyonu
- [ ] Antrenman şablonları
- [ ] Video egzersiz kılavuzları
- [ ] Wearable cihaz entegrasyonu
- [ ] Cloud senkronizasyon
- [ ] Çoklu dil desteği
- [ ] Dark mode

## ❓ SSS

### Verilerim nerede saklanıyor?
Tüm verileriniz cihazınızda yerel olarak Isar veritabanında güvenli bir şekilde saklanır.

### İnternet bağlantısı gerekli mi?
Hayır, uygulama tamamen offline çalışır.

### Verilerimi nasıl yedeklerim?
Şu anda manuel yedekleme özelliği bulunmamaktadır. Gelecek güncellemelerde eklenecektir.

## 📞 Destek

Herhangi bir sorun veya öneriniz için:

1. [GitHub Issues](https://github.com/ServetErdogan09/fitness_app/issues) üzerinden bildirim oluşturun
2. Pull request gönderin
3. Tartışmalar için [Discussions](https://github.com/ServetErdogan09/fitness_app/discussions) kullanın

---

<div align="center">

**⭐ Projeyi beğendiyseniz yıldız vermeyi unutmayın! ⭐**

Made with ❤️ and Flutter

</div>
