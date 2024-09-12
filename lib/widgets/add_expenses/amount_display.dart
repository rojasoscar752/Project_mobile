import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmountDisplay extends StatelessWidget {
  final String amount;

  const AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatAmount(amount),
      style: const TextStyle(
        fontSize: 30.0,
        letterSpacing: 2.0,
        fontWeight: FontWeight.bold      
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _formatAmount(String amount) {
    double value = double.tryParse(amount) ?? 0.00;
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(value);
  }
}