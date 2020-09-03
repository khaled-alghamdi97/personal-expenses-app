import 'package:flutter/cupertino.dart';
import 'package:personal_Expenses/models/transaction.dart';
import 'package:personal_Expenses/widgets/new-transaction.dart';
import 'package:personal_Expenses/widgets/transaction-list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "new shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "super market", amount: 60.50, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addTransaction: _addNewTransaction,
        ),
        TransactionList(
          transactions: _userTransactions,
        )
      ],
    );
  }
}
