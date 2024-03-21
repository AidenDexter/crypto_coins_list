import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
      trailing: const Icon(Icons.arrow_forward_ios),
      leading: SvgPicture.asset(
        'assets/icons/svg/bitcoin.svg',
        height: 30,
        width: 30,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '20000',
        style: theme.textTheme.labelSmall,
      ),
    );
  }
}
