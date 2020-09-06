import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:personal_Expenses/widgets/chart.dart';

// MY SUB WEDGIT
import 'package:personal_Expenses/widgets/new-transaction.dart';

import 'package:personal_Expenses/widgets/transaction-list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "flutter app",
        home: MyHomePage(),
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1", title: "new shoes", amount: 99.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "super market", amount: 60.50, date: DateTime.now())
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

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(
            addTransaction: _addNewTransaction,
          );
        });
  }

  List<Transaction> get _derivedTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Personal Expenses"), actions: [
        IconButton(
            onPressed: () => _startAddNewTransactions(context),
            icon: Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(
              recivedTransaction: _derivedTransactions,
            ),
            TransactionList(
              transactions: _userTransactions,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactions(context),
      ),
    );
  }
}
