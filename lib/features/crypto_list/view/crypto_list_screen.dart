import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/crypto_list_bloc.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBLoc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBLoc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('CryptoCurrenciesList'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBLoc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBLoc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.coinsList.length,
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                final theme = Theme.of(context);
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                        style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                      Text('Please try again later', style: theme.textTheme.labelSmall?.copyWith(fontSize: 16)),
                      // Text(
                      //   state.exception?.toString() ?? 'Exeption',
                      //   style: TextStyle(fontSize: 10),
                      // ),
                      SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            _cryptoListBLoc.add(LoadCryptoList());
                          },
                          child: Text('Try agein'))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
        //  _cryptoCoinsList == null
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemCount: _cryptoCoinsList!.length,
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];
        //           return CryptoCoinTile(coin: coin);
        //         }),
        );
  }
}
