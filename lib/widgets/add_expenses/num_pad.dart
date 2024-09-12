import 'package:calc_app/widgets/add_expenses/num_pad_table.dart';
import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final Function(String) onValueSelected;

  const NumPad({super.key, required this.onValueSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.0,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var constraintsHeight = constraints.biggest.height / 5;
          return Column(
            children: [
              NumPadTable(
                constraintsHeight: constraintsHeight,
                onInput: (value) => _handleInput(value),
                onDelete: () => _handleDelete(),
                onDecimal: () => _handleInput('.'),
                ),
            ],
          );
        },
        ),
    );
  }
   void _handleInput(String input) {
    onValueSelected(input);
  }

  void _handleDelete() {
    onValueSelected('delete');
  }
}