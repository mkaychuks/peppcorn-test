// To parse this JSON data, do
//
//     final trendingCoin = trendingCoinFromJson(jsonString);

import 'dart:convert';

TrendingCoin trendingCoinFromJson(String str) => TrendingCoin.fromJson(json.decode(str));

String trendingCoinToJson(TrendingCoin data) => json.encode(data.toJson());

class TrendingCoin {
    List<Coin> coins;

    TrendingCoin({
        required this.coins,
    });

    factory TrendingCoin.fromJson(Map<String, dynamic> json) => TrendingCoin(
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
    };
}

class Coin {
    Item item;

    Coin({
        required this.item,
    });

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        item: Item.fromJson(json["item"]),
    );

    Map<String, dynamic> toJson() => {
        "item": item.toJson(),
    };
}

class Item {
    String id;
    int coinId;
    String name;
    String symbol;
    int marketCapRank;
    String thumb;
    String small;
    String large;
    String slug;
    double priceBtc;
    int score;

    Item({
        required this.id,
        required this.coinId,
        required this.name,
        required this.symbol,
        required this.marketCapRank,
        required this.thumb,
        required this.small,
        required this.large,
        required this.slug,
        required this.priceBtc,
        required this.score,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        coinId: json["coin_id"],
        name: json["name"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
        slug: json["slug"],
        priceBtc: json["price_btc"]?.toDouble(),
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "coin_id": coinId,
        "name": name,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "small": small,
        "large": large,
        "slug": slug,
        "price_btc": priceBtc,
        "score": score,
    };
}
