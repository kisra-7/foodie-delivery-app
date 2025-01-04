import 'package:app/data%20base/firestore_db.dart';
import 'package:app/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_receipt.dart';

class OrderProgressPage extends StatefulWidget {
  const OrderProgressPage({super.key});

  @override
  State<OrderProgressPage> createState() => _OrderProgressPageState();
}

class _OrderProgressPageState extends State<OrderProgressPage> {
  FirestoreDb db = FirestoreDb();

  @override
  void initState() {
    super.initState();

    String receipt = context.read<Resturant>().displayReceipt();
    db.saveOrderToDb(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'FOODIE',
          style: GoogleFonts.cedarvilleCursive(
            fontSize: 30,
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [MyReceipt()],
        ),
      ),
    );
  }
}
