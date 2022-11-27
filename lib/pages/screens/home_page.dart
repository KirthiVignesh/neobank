// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:neobank/pages/utils/neobutton.dart';
import 'package:neobank/util/create_stellar_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserDetails();
    // _getBalance();
  }

  final user = FirebaseAuth.instance.currentUser!;
  String balance = '';
  Map<String, dynamic>? _userDetails;
  Future<void> _getBalance() async {
    String bal =
        await StellarFunctions.checkBalance(_userDetails!['secret_key']);
    // print("setting state");
    setState(() {
      balance = bal;
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
    _getBalance();
  }

  String recKey =
      'SA7ZPMJ5IOT52N6WCRPPOC23UO42ZSAW4QRIFO4PLIR456KZBUOCDE2V'; //example account

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 80,
        title: Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FlutterRemix.coins_fill,
              color: Colors.yellow[300],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "50",
                style: TextStyle(color: Colors.amber[200]),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 229, 251),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "Current Balance",
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 40,
                      ),
                    ),
                    balance.length == 0
                        ? CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          )
                        : Container(
                            child: Column(children: [
                            Text(
                              "₹ $balance",
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 30,
                              ),
                            )
                          ])),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(50)),
                        // height: 100,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            StellarFunctions.transferMoney(
                                '1000', _userDetails!['secret_key'], recKey);
                          },
                          color: Colors.blue,
                          icon: Icon(FlutterRemix.bank_card_line,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Transfer Money")
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(50)),
                        // height: 100,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            StellarFunctions.transferMoneyFromBank(
                                '1000', _userDetails!['secret_key']);
                          },
                          color: Colors.blue,
                          icon: Icon(FlutterRemix.money_dollar_circle_line,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Buy Assets")
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
