import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_Expenses/models/transaction.dart';
import 'package:personal_Expenses/widgets/char_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recivedTransaction;

  Chart({this.recivedTransaction});

  List<Map<String, Object>> get _groupedTransactionValue {
    return List.generate(7, (index) {
      var totalAmount = 0.0;
      var weekDay = DateTime.now().subtract(Duration(days: index));

      for (var i = 0; i < recivedTransaction.length; i++) {
        if (recivedTransaction[i].date.day == weekDay.day &&
            recivedTransaction[i].date.month == weekDay.month &&
            recivedTransaction[i].date.year == weekDay.year) {
          totalAmount += recivedTransaction[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalAmount
      };
    });
  }

  double get _totalSpending {
    return _groupedTransactionValue.fold(
        0.0, (sum, element) => sum + element['amount']);

    /// fold is basically change the type of a function ,0.0  is the start value of sum which is the variable
  }

  @override
  Widget build(BuildContext context) {
    print(_groupedTransactionValue);
    return Card(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _groupedTransactionValue.map((e) {
          return Expanded(
            flex: 1,
            child: ChartBar(
              label: e['day'],
              spending: e['amount'],
              spendingPcOfTotal: _totalSpending == 0
                  ? 0.0
                  : (e['amount'] as double) / _totalSpending,
            ),
          );
        }).toList(),
      ),
      elevation: 6,
    );
  }
}
