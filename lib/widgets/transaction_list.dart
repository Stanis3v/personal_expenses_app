import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.fromLTRB(15, 3, 15, 3),
            child: Row(
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 1),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    //tx.amount.toString() + '\$',
                    '\$${transactions[index].amount.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.0,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 15, 15, 15),
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd("en_US")
                          .add_jm()
                          .format(transactions[index].date),
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 95, 108, 114),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
