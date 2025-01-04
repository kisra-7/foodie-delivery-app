import 'package:app/models/resturant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDb {
  Resturant rest = Resturant();

  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderToDb(String receipt) async {
    await orders.add(
        {'date': DateTime.now(), 'order': receipt, 'location': rest.location});
  }
}
