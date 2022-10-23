import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PERSONAL EXPENSES',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'NeonGlow',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 20,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 54, 54, 54),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 70.09,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New bag',
      amount: 290.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Creating a Scaffold widget.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MY EXPENSES'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
              color: Colors.cyanAccent,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColorDark,
                child: const Text('CHART'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: const Icon(
          Icons.add,
          color: Colors.cyanAccent,
          size: 40,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
