import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_Expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recivedTransaction;

  Chart({this.recivedTransaction});

  List<Map<String, Object>> get groupedTransactionValue {
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
      print(DateFormat.E().format(weekDay));
      print(totalAmount);

      return {"day": DateFormat.E().format(weekDay), "amount": totalAmount};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      child: Row(
        children: groupedTransactionValue.map((e) {
          return Text("${e['day']}  ${e['amount']}");
        }).toList(),
      ),
      elevation: 6,
    );
  }
}
