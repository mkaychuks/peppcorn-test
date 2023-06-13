// To parse this JSON data, do
//
//     final nftModel = nftModelFromJson(jsonString);

import 'dart:convert';

List<NftModel> nftModelFromJson(String str) => List<NftModel>.from(json.decode(str).map((x) => NftModel.fromJson(x)));

String nftModelToJson(List<NftModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NftModel {
    String id;
    String contractAddress;
    String name;
    AssetPlatformId assetPlatformId;
    String symbol;

    NftModel({
        required this.id,
        required this.contractAddress,
        required this.name,
        required this.assetPlatformId,
        required this.symbol,
    });

    factory NftModel.fromJson(Map<String, dynamic> json) => NftModel(
        id: json["id"],
        contractAddress: json["contract_address"],
        name: json["name"],
        assetPlatformId: assetPlatformIdValues.map[json["asset_platform_id"]]!,
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "contract_address": contractAddress,
        "name": name,
        "asset_platform_id": assetPlatformIdValues.reverse[assetPlatformId],
        "symbol": symbol,
    };
}

enum AssetPlatformId { ETHEREUM, POLYGON_POS }

final assetPlatformIdValues = EnumValues({
    "ethereum": AssetPlatformId.ETHEREUM,
    "polygon-pos": AssetPlatformId.POLYGON_POS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
