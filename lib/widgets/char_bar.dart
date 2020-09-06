import 'package:flutter/cupertino.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPcOfTotal;

  const ChartBar({this.label, this.spending, this.spendingPcOfTotal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("\$${spending.toStringAsFixed(0)}"),
        SizedBox(
          height: 4,
        ),
        Container()
      ],
    );
  }
}
