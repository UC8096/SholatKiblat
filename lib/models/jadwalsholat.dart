part of 'models.dart';

class JadwalSholat {
  JadwalSholat({
    this.code,
    this.status,
    this.results,
  });

  int? code;
  String? status;
  Results? results;

  JadwalSholat copyWith({
    int? code,
    String? status,
    Results? results,
  }) =>
      JadwalSholat(
        code: code ?? this.code,
        status: status ?? this.status,
        results: results ?? this.results,
      );

  factory JadwalSholat.fromJson(String str) =>
      JadwalSholat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JadwalSholat.fromMap(Map<String, dynamic> json) => JadwalSholat(
        code: json["code"],
        status: json["status"],
        results: Results.fromMap(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "results": results!.toMap(),
      };
}

class Results {
  Results({
    this.datetime,
    this.location,
    this.settings,
  });

  List<Datetime>? datetime;
  Location? location;
  Settings? settings;

  Results copyWith({
    List<Datetime>? datetime,
    Location? location,
    Settings? settings,
  }) =>
      Results(
        datetime: datetime ?? this.datetime,
        location: location ?? this.location,
        settings: settings ?? this.settings,
      );

  factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        datetime: List<Datetime>.from(
            json["datetime"].map((x) => Datetime.fromMap(x))),
        location: Location.fromMap(json["location"]),
        settings: Settings.fromMap(json["settings"]),
      );

  Map<String, dynamic> toMap() => {
        "datetime": List<dynamic>.from(datetime!.map((x) => x.toMap())),
        "location": location!.toMap(),
        "settings": settings!.toMap(),
      };
}

class Datetime {
  Datetime({
    this.times,
    this.date,
  });

  Times? times;
  Date? date;

  Datetime copyWith({
    Times? times,
    Date? date,
  }) =>
      Datetime(
        times: times ?? this.times,
        date: date ?? this.date,
      );

  factory Datetime.fromJson(String str) => Datetime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datetime.fromMap(Map<String, dynamic> json) => Datetime(
        times: Times.fromMap(json["times"]),
        date: Date.fromMap(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "times": times!.toMap(),
        "date": date!.toMap(),
      };
}

class Date {
  Date({
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  int? timestamp;
  String? gregorian;
  String? hijri;

  Date copyWith({
    int? timestamp,
    String? gregorian,
    String? hijri,
  }) =>
      Date(
        timestamp: timestamp ?? this.timestamp,
        gregorian: gregorian ?? this.gregorian,
        hijri: hijri ?? this.hijri,
      );

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"],
        gregorian: json["gregorian"],
        hijri: json["hijri"],
      );

  Map<String, dynamic> toMap() => {
        "timestamp": timestamp,
        "gregorian": gregorian,
        "hijri": hijri,
      };
}

class Times {
  Times({
    this.imsak,
    this.sunrise,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.midnight,
  });

  String? imsak;
  String? sunrise;
  String? fajr;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? midnight;

  Times copyWith({
    String? imsak,
    String? sunrise,
    String? fajr,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? midnight,
  }) =>
      Times(
        imsak: imsak ?? this.imsak,
        sunrise: sunrise ?? this.sunrise,
        fajr: fajr ?? this.fajr,
        dhuhr: dhuhr ?? this.dhuhr,
        asr: asr ?? this.asr,
        sunset: sunset ?? this.sunset,
        maghrib: maghrib ?? this.maghrib,
        isha: isha ?? this.isha,
        midnight: midnight ?? this.midnight,
      );

  factory Times.fromJson(String str) => Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Times.fromMap(Map<String, dynamic> json) => Times(
        imsak: json["Imsak"],
        sunrise: json["Sunrise"],
        fajr: json["Fajr"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );

  Map<String, dynamic> toMap() => {
        "Imsak": imsak,
        "Sunrise": sunrise,
        "Fajr": fajr,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Midnight": midnight,
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.elevation,
    this.city,
    this.country,
    this.countryCode,
    this.timezone,
    this.localOffset,
  });

  double? latitude;
  double? longitude;
  double? elevation;
  String? city;
  String? country;
  String? countryCode;
  String? timezone;
  double? localOffset;

  Location copyWith({
    double? latitude,
    double? longitude,
    double? elevation,
    String? city,
    String? country,
    String? countryCode,
    String? timezone,
    double? localOffset,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        elevation: elevation ?? this.elevation,
        city: city ?? this.city,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        timezone: timezone ?? this.timezone,
        localOffset: localOffset ?? this.localOffset,
      );

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        elevation: json["elevation"],
        city: json["city"],
        country: json["country"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        localOffset: json["local_offset"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "city": city,
        "country": country,
        "country_code": countryCode,
        "timezone": timezone,
        "local_offset": localOffset,
      };
}

class Settings {
  Settings({
    this.timeformat,
    this.school,
    this.juristic,
    this.highlat,
    this.fajrAngle,
    this.ishaAngle,
  });

  String? timeformat;
  String? school;
  String? juristic;
  String? highlat;
  double? fajrAngle;
  double? ishaAngle;

  Settings copyWith({
    String? timeformat,
    String? school,
    String? juristic,
    String? highlat,
    double? fajrAngle,
    double? ishaAngle,
  }) =>
      Settings(
        timeformat: timeformat ?? this.timeformat,
        school: school ?? this.school,
        juristic: juristic ?? this.juristic,
        highlat: highlat ?? this.highlat,
        fajrAngle: fajrAngle ?? this.fajrAngle,
        ishaAngle: ishaAngle ?? this.ishaAngle,
      );

  factory Settings.fromJson(String str) => Settings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Settings.fromMap(Map<String, dynamic> json) => Settings(
        timeformat: json["timeformat"],
        school: json["school"],
        juristic: json["juristic"],
        highlat: json["highlat"],
        fajrAngle: json["fajr_angle"],
        ishaAngle: json["isha_angle"],
      );

  Map<String, dynamic> toMap() => {
        "timeformat": timeformat,
        "school": school,
        "juristic": juristic,
        "highlat": highlat,
        "fajr_angle": fajrAngle,
        "isha_angle": ishaAngle,
      };
}
