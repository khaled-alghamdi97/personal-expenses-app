import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_Expenses/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "new shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "super market", amount: 170.25, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Personal Expenses"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Card(
                child: Text(
                  "weakly expenses",
                  textAlign: TextAlign.center,
                ),
                color: Colors.blue,
                elevation: 5,
              ),
              width: double.infinity,
            ),
            Container(
              child: Column(
                children: transactions
                    .map((transaction) => Card(
                          child: Text(transaction.title),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
