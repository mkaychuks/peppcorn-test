// To parse this JSON data, do
//
//     final assetPlatformModel = assetPlatformModelFromJson(jsonString);

import 'dart:convert';

List<AssetPlatformModel> assetPlatformModelFromJson(String str) => List<AssetPlatformModel>.from(json.decode(str).map((x) => AssetPlatformModel.fromJson(x)));

String assetPlatformModelToJson(List<AssetPlatformModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetPlatformModel {
    String id;
    int? chainIdentifier;
    String name;
    String shortname;

    AssetPlatformModel({
        required this.id,
        this.chainIdentifier,
        required this.name,
        required this.shortname,
    });

    factory AssetPlatformModel.fromJson(Map<String, dynamic> json) => AssetPlatformModel(
        id: json["id"],
        chainIdentifier: json["chain_identifier"],
        name: json["name"],
        shortname: json["shortname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chain_identifier": chainIdentifier,
        "name": name,
        "shortname": shortname,
    };
}
