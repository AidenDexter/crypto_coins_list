import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/view/crypto_list_screen.dart';

final routers = {'/': (context) => const CryptoListScreen(), '/coin': (context) => const CryptoCoinScreen()};
