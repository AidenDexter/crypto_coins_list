import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    required this.hight24Hour,
    required this.low24Hour,
    required this.toSymbol,
    required this.lastUpdate,
  });
  final String name;
  final double priceInUSD;
  final String imageUrl;
  final double hight24Hour;
  final double low24Hour;
  final String toSymbol;
  final DateTime lastUpdate;
  @override
  List<Object?> get props => [name, priceInUSD, imageUrl, hight24Hour, low24Hour, toSymbol, lastUpdate];
}
