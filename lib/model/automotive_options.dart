// To parse this JSON data, do
//
//     final automotiveOptions = automotiveOptionsFromMap(jsonString);

import 'dart:convert';

class AutomotiveOptions {
  AutomotiveOptions({
    this.success,
    this.countries,
    this.categories,
    this.currency,
    this.body,
    this.mechincalCodition,
    this.bodyType,
    this.color,
    this.transmission,
    this.regionalSpecs,
    this.cylinders,
    this.doors,
    this.horsePower,
    this.warranty,
    this.fuelType,
  });

  bool success;
  List<Country> countries;
  List<Category> categories;
  List<String> currency;
  List<Body> body;
  List<Body> mechincalCodition;
  List<Body> bodyType;
  List<Body> color;
  List<Body> transmission;
  List<Body> regionalSpecs;
  List<Body> cylinders;
  List<Body> doors;
  List<Body> horsePower;
  List<Body> warranty;
  List<Body> fuelType;

  factory AutomotiveOptions.fromJson(String str) =>
      AutomotiveOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AutomotiveOptions.fromMap(Map<String, dynamic> json) =>
      AutomotiveOptions(
        success: json["success"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromMap(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        currency: List<String>.from(json["currency"].map((x) => x)),
        body: List<Body>.from(json["body"].map((x) => Body.fromMap(x))),
        mechincalCodition: List<Body>.from(
            json["mechincal_codition"].map((x) => Body.fromMap(x))),
        bodyType:
            List<Body>.from(json["body_type"].map((x) => Body.fromMap(x))),
        color: List<Body>.from(json["color"].map((x) => Body.fromMap(x))),
        transmission:
            List<Body>.from(json["transmission"].map((x) => Body.fromMap(x))),
        regionalSpecs:
            List<Body>.from(json["regional_specs"].map((x) => Body.fromMap(x))),
        cylinders:
            List<Body>.from(json["cylinders"].map((x) => Body.fromMap(x))),
        doors: List<Body>.from(json["doors"].map((x) => Body.fromMap(x))),
        horsePower:
            List<Body>.from(json["horse_power"].map((x) => Body.fromMap(x))),
        warranty: List<Body>.from(json["warranty"].map((x) => Body.fromMap(x))),
        fuelType:
            List<Body>.from(json["fuel_type"].map((x) => Body.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "countries": List<dynamic>.from(countries.map((x) => x.toMap())),
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "currency": List<dynamic>.from(currency.map((x) => x)),
        "body": List<dynamic>.from(body.map((x) => x.toMap())),
        "mechincal_codition":
            List<dynamic>.from(mechincalCodition.map((x) => x.toMap())),
        "body_type": List<dynamic>.from(bodyType.map((x) => x.toMap())),
        "color": List<dynamic>.from(color.map((x) => x.toMap())),
        "transmission": List<dynamic>.from(transmission.map((x) => x.toMap())),
        "regional_specs":
            List<dynamic>.from(regionalSpecs.map((x) => x.toMap())),
        "cylinders": List<dynamic>.from(cylinders.map((x) => x.toMap())),
        "doors": List<dynamic>.from(doors.map((x) => x.toMap())),
        "horse_power": List<dynamic>.from(horsePower.map((x) => x.toMap())),
        "warranty": List<dynamic>.from(warranty.map((x) => x.toMap())),
        "fuel_type": List<dynamic>.from(fuelType.map((x) => x.toMap())),
      };
}

class Body {
  Body({
    this.id,
    this.langKey,
    this.masterType,
    this.lang,
  });

  int id;
  String langKey;
  int masterType;
  Lang lang;

  factory Body.fromJson(String str) => Body.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        id: json["id"],
        langKey: json["lang_key"],
        masterType: json["master_type"],
        lang: Lang.fromMap(json["lang"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lang_key": langKey,
        "master_type": masterType,
        "lang": lang.toMap(),
      };
}

class Lang {
  Lang({
    this.id,
    this.langKey,
    this.type,
    this.english,
    this.arabic,
    this.dutch,
    this.french,
    this.german,
    this.italian,
    this.portuguese,
    this.russian,
    this.spanish,
    this.turkish,
  });

  int id;
  String langKey;
  Type type;
  String english;
  String arabic;
  String dutch;
  String french;
  String german;
  String italian;
  String portuguese;
  String russian;
  String spanish;
  String turkish;

  factory Lang.fromJson(String str) => Lang.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lang.fromMap(Map<String, dynamic> json) => Lang(
        id: json["id"],
        langKey: json["lang_key"],
        type: typeValues.map[json["type"]],
        english: json["english"],
        arabic: json["arabic"],
        dutch: json["dutch"],
        french: json["french"],
        german: json["german"],
        italian: json["italian"],
        portuguese: json["portuguese"],
        russian: json["russian"],
        spanish: json["spanish"],
        turkish: json["turkish"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lang_key": langKey,
        "type": typeValues.reverse[type],
        "english": english,
        "arabic": arabic,
        "dutch": dutch,
        "french": french,
        "german": german,
        "italian": italian,
        "portuguese": portuguese,
        "russian": russian,
        "spanish": spanish,
        "turkish": turkish,
      };
}

enum Type { MASTER, CATEGORY }

final typeValues =
    EnumValues({"category": Type.CATEGORY, "master": Type.MASTER});

class Category {
  Category({
    this.id,
    this.langKey,
    this.automotive,
    this.carFields,
  });

  int id;
  Lang langKey;
  String automotive;
  String carFields;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        langKey: Lang.fromMap(json["lang_key"]),
        automotive: json["automotive"],
        carFields: json["car_fields"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lang_key": langKey.toMap(),
        "automotive": automotive,
        "car_fields": carFields,
      };
}

class Country {
  Country({
    this.id,
    this.sortname,
    this.name,
    this.code,
  });

  int id;
  String sortname;
  String name;
  int code;

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json["id"],
        sortname: json["sortname"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "sortname": sortname,
        "name": name,
        "code": code,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
