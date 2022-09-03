import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: transactions.map((tx) {
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
                  '${tx.amount}\$',
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
                    tx.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 15, 15, 15),
                    ),
                  ),
                  Text(
                    DateFormat.yMMMMd("en_US").add_jm().format(tx.date),
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
      }).toList(),
    );
  }
}
