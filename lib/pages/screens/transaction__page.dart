import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neobank/util/create_stellar_account.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
    // _getTransactions();
  }

  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? _userDetails;
  List<String> transactions = List.empty(growable: true);
  Future<void> _getTransactions() async {
    final ts =
        await StellarFunctions.getTransactions(_userDetails!['secret_key']);
    setState(() {
      transactions = ts;
    });
  }

  Future<void> _getUserDetails() async {
    await FirebaseFirestore.instance
        .collection('account')
        .doc(user.uid)
        .get()
        .then((value) {
      setState(() {
        _userDetails = value.data();
      });
    });
    _getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          toolbarHeight: 80,
          title: Text("Transactions"),
        ),
        body: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: ((context, index) {
              return Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.deepPurple[100],
                  borderOnForeground: true,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Text(
                    '${transactions[index]}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ));
            })));
  }
}
