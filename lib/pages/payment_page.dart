import 'package:app/components/cust_button.dart';
import 'package:app/pages/order_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool showBackView = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void payNowOnTap() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Payments'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card number: $cardNumber'),
                Text('Expiry date: $expiryDate'),
                Text('Card holder name: $cardHolderName'),
                Text('CCV code: $cvvCode'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderProgressPage(),
                  ),
                );
              },
              child: const Text(
                'Confirm',
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Text('Invalid form info..'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: theme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            bankName: 'Bank Muscat',
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (val) {},
          ),
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustButton(
              text: 'Pay Now',
              onTap: payNowOnTap,
            ),
          ),
        ],
      ),
    );
  }
}
