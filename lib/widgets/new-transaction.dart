import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  final Function addTransaction;

  NewTransaction({this.addTransaction});

  void addTx() {
    final tController = titleControler.text;
    final aController = amountControler.text;

    if (tController.isEmpty || aController.isEmpty) {
      return;
    }

    addTransaction(tController, double.parse(aController));
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
              color: Colors.purple,
              textColor: Colors.white,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
