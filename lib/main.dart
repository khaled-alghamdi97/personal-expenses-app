import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/material/colors.dart';
import 'package:personal_Expenses/widgets/chart.dart';

// MY SUB WEDGIT
import 'package:personal_Expenses/widgets/new-transaction.dart';

import 'package:personal_Expenses/widgets/transaction-list.dart';

import 'models/transaction.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();    

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);*/
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

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime datePicked) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: datePicked,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deletTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
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
    final appBar = AppBar(title: Text("expenses"), actions: [
      IconButton(
          onPressed: () => _startAddNewTransactions(context),
          icon: Icon(Icons.add))
    ]);
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(
                recivedTransaction: _derivedTransactions,
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: TransactionList(
                transactions: _userTransactions,
                deleteTx: _deletTransaction,
              ),
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
