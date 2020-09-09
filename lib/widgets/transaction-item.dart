import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Card(
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Container(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    "\$${transaction.amount}",
                  ),
                ),
              ),
            ),
            title: Text("${transaction.title}",
                style: Theme.of(context).textTheme.title),
            subtitle: Text(DateFormat.yMEd().format(transaction.date)),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteTx(transaction.id),
              color: Theme.of(context).errorColor,
            ),
          )),
    );
  }
}
