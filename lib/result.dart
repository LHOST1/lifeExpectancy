import 'package:lifeexpectancy/user_data.dart';

class Hesap {
  UserData userData;
  Hesap(this.userData);
  double Hesaplama() {
    double sonuc;

    sonuc = 90 + (userData.sporSayisi / 7) - (userData.sigarasayisi / 600);
    sonuc = sonuc + (userData.boy / userData.kilo);
    if (userData.durum == 1) {
      return sonuc + 10;
    } else {
      return sonuc;
    }
  }

  double hesaplaOrtalamaYasamBeklentisi() {
    int sporGunSayisi;
    int sigaraAdet;
    String cinsiyet;
    double boy;
    double kilo;
    sporGunSayisi = userData.sporSayisi;
    sigaraAdet = userData.sigarasayisi;
    if (userData.durum == 1) {
      cinsiyet = "kadın";
    } else {
      cinsiyet = "erkek";
    }
    boy = userData.boy;
    kilo = userData.kilo;

    // Ortalama yaşam beklentisini etkileyen faktörlerin başlangıç değerleri
    double ortalamaYasamBeklentisi =
        80.0; // Ortalama yaşam beklentisi için başlangıç değeri (örneğin)
    double sigaraFaktoru = 0.0;
    double sporFaktoru = 0.0;
    double cinsiyetFaktoru = 0.0;
    double boyKiloFaktoru = 0.0;

    // Cinsiyete göre faktörü belirle
    if (cinsiyet.toLowerCase() == 'kadın') {
      cinsiyetFaktoru =
          -5.0; // Kadınlar için ortalama yaşam beklentisi genellikle biraz daha yüksektir
    } else if (cinsiyet.toLowerCase() == 'erkek') {
      cinsiyetFaktoru = 0.0;
    } else {
      print('Geçersiz cinsiyet');
      return 0.0;
    }

    // Sigara içme miktarına göre faktörü belirle
    if (sigaraAdet > 0) {
      sigaraFaktoru = -sigaraAdet.toDouble() *
          0.5; // Sigara içmek ortalama yaşam beklentisini azaltır
    }

    // Spor yapma sıklığına göre faktörü belirle
    if (sporGunSayisi >= 5) {
      sporFaktoru =
          3.0; // Haftada 5 gün veya daha fazla spor yapmak ortalama yaşam beklentisini artırır
    }

    if (boy > 1 && kilo > 1) {
      double vucutKitleIndeksi = kilo / (boy * boy);
      if (vucutKitleIndeksi < 18.5) {
        boyKiloFaktoru =
            -5.0; // Zayıf vücut kitle indeksi ortalama yaşam beklentisini azaltır
      } else if (vucutKitleIndeksi >= 25.0) {
        boyKiloFaktoru =
            -3.0; // Fazla kilolu vücut kitle indeksi ortalama yaşam beklentisini azaltır
      } else {
        boyKiloFaktoru = 0.0; // Normal vücut kitle indeksi
      }
    } else {
      print('Geçersiz boy veya kilo');
      return 0.0;
    }

    // Ortalama yaşam beklentisini hesapla
    ortalamaYasamBeklentisi +=
        sigaraFaktoru + sporFaktoru + cinsiyetFaktoru + boyKiloFaktoru;

    return ortalamaYasamBeklentisi;
  }
}
