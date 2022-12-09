import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../util/create_stellar_account.dart';

class TransferMoney extends StatefulWidget {
  final String addr;
  const TransferMoney({super.key, required this.addr});

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  bool _isLoading = false;
  bool _isCompleted = false;
  void sendTransaction() async {
    setState(() {
      _isLoading = true;
    });
    await StellarFunctions.transferMoney(_amountController.text.trim(),
        widget.addr, _addressController.text.trim());
    setState(() {
      _isCompleted = true;
    });
    setState(() {
      _isLoading = false;
    });
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        onConfirmBtnTap: () {
          Navigator.pop(context);
        },
        text: "Transaction is Successful");
  }

  final _addressController = TextEditingController();
  final _amountController = TextEditingController();
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final AmountValidator = RangeValidator(
      min: 0, max: 10000, errorText: 'Enter a valid amount below 10000');
  @override
  Widget build(BuildContext context) {
    if (_isLoading)
      return Scaffold(
        body: Center(
            child: Row(
          children: [
            Text("Executing Transaction"),
            CircularProgressIndicator(
              color: Colors.deepPurpleAccent,
            )
          ],
        )),
      );
    else if (_isCompleted)
      return Scaffold(
        body: Center(child: Text("Transaction is successful")),
      );
    else
      return Scaffold(
        body: Row(
          children: [
            TextFormField(
              controller: _amountController,
              validator: AmountValidator,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Amount to be transfered',
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Receiver Address',
                  fillColor: Colors.white,
                  filled: true),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: sendTransaction,
                child: Row(
                  children: [
                    Text('Tansfer money  '),
                    Icon(FlutterRemix.send_plane_2_line)
                  ],
                ))
          ],
        ),
      );
  }
}
