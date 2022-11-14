import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/main.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/hi.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade50,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorLight,
                                width: 1),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}\$',
                            style: Theme.of(context).textTheme.subtitle2,
                            /**
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.0,
                        color: Colors.blueGrey.shade900,
                      ),
                      */
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].title,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.subtitle1,
                              /**TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        */
                            ),
                            Text(
                              DateFormat.yMMMMd("en_US")
                                  .add_jm()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.blueGrey.shade700,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
