import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPcOfTotal;

  const ChartBar({this.label, this.spending, this.spendingPcOfTotal});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constarins) {
      return Column(
        children: [
          Container(
            child: FittedBox(child: Text("\$${spending.toStringAsFixed(0)}")),
            height: constarins.maxHeight * 0.15,
          ),
          SizedBox(
            height: constarins.maxHeight * 0.05,
          ),
          Container(
            height: constarins.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPcOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constarins.maxHeight * 0.05,
          ),
          Container(
            height: constarins.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              label,
              style: TextStyle(color: Colors.grey),
            )),
          )
        ],
      );
    });
  }
}
