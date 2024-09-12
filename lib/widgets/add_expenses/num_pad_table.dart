import 'package:calc_app/widgets/add_expenses/num_pad_button.dart';
import 'package:flutter/material.dart';

class NumPadTable extends StatelessWidget {
  final double constraintsHeight;
  final void Function(String) onInput;
  final VoidCallback onDelete;
  final VoidCallback onDecimal;

  const NumPadTable({
    super.key,
    required this.constraintsHeight,
    required this.onInput,
    required this.onDelete,
    required this.onDecimal,
    });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder.symmetric(
        inside: BorderSide(width: 0.1),
      ),
      children: [
          _builRow(['1', '2', '3'], onInput),
          _builRow(['4', '5', '6'], onInput),
          _builRow(['7', '8', '9'], onInput),
        TableRow(children: [
            NumPadButton(
              label: '.',
              height: constraintsHeight,
              onPressed: onDecimal,
            ),
          NumPadButton(
            label: '0',
            height: constraintsHeight,
            onPressed: () => onInput('0'),
          ),
          NumPadButton(
            icon: const Icon(Icons.backspace,
                size: 35.0),
            height: constraintsHeight,
            onPressed: onDelete,
          ),
        ]),
      ],
    );
  }
  
  _builRow(List<String> labels, void Function(String) onPressed) {
    return TableRow(
      children: labels
          .map((label) => NumPadButton(
            label: label,
            height: constraintsHeight,
            onPressed:  () => onPressed(label),
            ))
          .toList(),
    );
  }
}