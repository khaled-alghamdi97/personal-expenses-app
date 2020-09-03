import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// MY SUB WEDGIT
import 'package:personal_Expenses/widgets/new-transaction.dart';

import 'package:personal_Expenses/widgets/transaction-list.dart';
import 'package:personal_Expenses/widgets/user-transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Personal Expenses"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              UserTransaction()
            ],
          ),
        ),
      ),
    );
  }
}
