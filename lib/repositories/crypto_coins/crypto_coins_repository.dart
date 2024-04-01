import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {

  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio
        .get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,SOL,CAG,DOV&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)["USD"];

      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,

        imageUrl: "http://www.cryptocompare.com/$imageUrl",

      );
    }).toList();
    return cryptoCoinsList;
  }
  @override
  Future<CryptoCoinDetails> getCoinDetails(String currencyCode) async {
    final response =
        await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final hight24Hour = usdData['HIGHT24HOUR'];
    final low24Hour = usdData['LOW24HOUR'];

    return CryptoCoinDetails(
      name: currencyCode,
      priceInUSD: price,
      toSymbol: toSymbol,
      hight24Hour: hight24Hour,
      low24Hour: low24Hour,
      imageUrl: 'http://www.cryptocompare.com/$imageUrl',
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
    );
  }

}
