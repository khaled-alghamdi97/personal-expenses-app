import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();

  final _amountControler = TextEditingController();
  DateTime _selectedDate;

  void addTx() {
    final tController = _titleControler.text;
    final aController = double.parse(_amountControler.text);

    if (tController.isEmpty ||
        aController <= 0 ||
        _selectedDate == null ||
        aController == null) {
      print("it returned");
      return;
    }

    widget.addTransaction(tController, aController, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleControler,
              onSubmitted: (_) => addTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountControler,
              onSubmitted: (_) => addTx(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child: Text(_selectedDate == null
                          ? "No chosen Date"
                          : DateFormat.yMd().format(_selectedDate))),
                  FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        "Select a date",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
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
    );
  }
}
