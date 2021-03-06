import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionHandler;
  NewTransaction(this.addTransactionHandler);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTransactionHandler(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                // onChanged: (val) => amountInput = val,
                controller: amountController,
                //keyboardType: TextInputType.number,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                //onSubmitted:(val) => submitData,
                onSubmitted: (_) =>
                    submitData() //(_) this means that i know that we can revice value but i don't care
                ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              // textColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
