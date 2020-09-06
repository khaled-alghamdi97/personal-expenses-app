import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();

  final amountControler = TextEditingController();

  void addTx() {
    final tController = titleControler.text;
    final aController = amountControler.text;

    if (tController.isEmpty || aController.isEmpty) {
      return;
    }

    widget.addTransaction(tController, double.parse(aController));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleControler,
              onSubmitted: (_) => addTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountControler,
              onSubmitted: (_) => addTx(),
            ),
            FlatButton(
              onPressed: addTx,
              child: Text("Add transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
