import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_Expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "The list is empty Hit + to add new one",
                ),
                Container(
                  child: Image.asset(
                    "assest/images/empty.png",
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                  width: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 60,
                          child: Text(
                            "\$${transactions[index].amount}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 3)),
                          padding: EdgeInsets.all(10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat()
                                .add_yMEd()
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
