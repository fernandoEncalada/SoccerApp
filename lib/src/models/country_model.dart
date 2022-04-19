import 'dart:convert';

import 'leagues_model.dart';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

class Countries {
    Countries({
        required this.data,
        required this.meta,
    });

    List<Country> data;
    Meta meta;

    factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );
}

class Country {
    Country({
        required this.id,
        required this.name,
        required this.imagePath,
        required this.extra,
    });

    int id;
    String name;
    String imagePath;
    Extra? extra;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? '' : json["name"],
        imagePath: json["image_path"] == null ? '' : json["image_path"],
        extra: json["extra"] == null ? json["extra"] : Extra.fromJson(json["extra"]),
    );

}

class Extra {
    Extra({
        required this.continent,
        required this.subRegion,
        required this.worldRegion,
        required this.fifa,
        required this.iso,
        required this.iso2,
        required this.longitude,
        required this.latitude,
        required this.flag,
    });

    String continent;
    String subRegion;
    String worldRegion;
    String fifa;
    String iso;
    String iso2;
    String longitude;
    String latitude;
    String flag;

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        continent: json["continent"] == null ? '' : json["continent"],
        subRegion: json["sub_region"] == null ? '' : json["sub_region"],
        worldRegion: json["world_region"] == null ? '' : json["world_region"],
        fifa: json["fifa"] == null ? '' : json["fifa"],
        iso: json["iso"] == null ? '' : json["iso"],
        iso2: json["iso2"] == null ? '' : json["iso2"],
        longitude: json["longitude"] == null ? '' : json["longitude"],
        latitude: json["latitude"] == null ? '' : json["latitude"],
        flag: json["flag"] == null ? '' : json["flag"],
    );

}