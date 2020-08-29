import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 1150.00,
      date: DateTime.parse("2020-08-17 20:18:04Z"),
    ),
    Transaction(
      id: 't2',
      title: 'New Pants',
      amount: 2799.00,
      date: DateTime.parse("2020-08-18 20:18:04Z"),
    ),
    Transaction(
      id: 't3',
      title: 'New Watch',
      amount: 2150.00,
      date: DateTime.parse("2020-08-19 20:18:04Z"),
    ),
    Transaction(
      id: 't4',
      title: 'New Shirt',
      amount: 999.99,
      date: DateTime.parse("2020-08-20 20:18:04Z"),
    ),
    Transaction(
      id: 't5',
      title: 'New Clock',
      amount: 450.00,
      date: DateTime.parse("2020-08-21 20:18:04Z"),
    ),
    Transaction(
      id: 't6',
      title: 'New Pen',
      amount: 759.99,
      date: DateTime.parse("2020-08-22 20:18:04Z"),
    ),
    Transaction(
      id: 't7',
      title: 'New Headphone',
      amount: 959.99,
      date: DateTime.parse("2020-08-23 20:18:04Z"),
    ),
  ];

  void _addNewTransaction({String title, double amount, DateTime date}) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      id: _userTransactions.length.toString(),
      date: date,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewTransaction(
        addTransaction: _addNewTransaction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: BarChartSample1(
              transactions: _userTransactions,
            ),
          ),
          TransactionList(
            transactions: _userTransactions.reversed.toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
