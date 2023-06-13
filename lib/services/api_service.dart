import 'package:http/http.dart' as http;
import 'package:pep_test/models/assetplatform_model.dart';
import 'package:pep_test/models/nft_model.dart';
import 'package:pep_test/models/trending_model.dart';




class ApiService {
  final baseUrl = "https://api.coingecko.com/api/v3/";


  Future<TrendingCoin?> getTrendingCoins() async {
    var uri = Uri.parse("${baseUrl}search/trending");
    var response = await http.get(uri);
    return trendingCoinFromJson(response.body);
  }


  Future<List<NftModel>> getTop10Nft() async {
    var uri = Uri.parse("${baseUrl}nfts/list?per_page=10&page=1");
    var response = await http.get(uri);
    return nftModelFromJson(response.body);
  }

  Future<List<AssetPlatformModel>> getAssetPlatform() async {
    var uri = Uri.parse("${baseUrl}asset_platforms");
    var response = await http.get(uri);
    return assetPlatformModelFromJson(response.body);
  }


}