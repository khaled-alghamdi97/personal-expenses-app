import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:personal_Expenses/models/transaction.dart';
import './transaction-item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrains) {
              return Column(
                children: [
                  Text(
                    "The list is empty Hit + to add new one",
                  ),
                  Container(
                    child: Image.asset(
                      "assest/images/empty.png",
                      fit: BoxFit.cover,
                    ),
                    height: constrains.maxHeight * 0.6,
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
