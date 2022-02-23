
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  String collection;

  FirestoreService({required this.collection});


  late CollectionReference _firestoreReferences = FirebaseFirestore.instance
      .collection(this.collection);


  Future <List<Map<String, dynamic>>> getProductHome() async {
    List<Map<String, dynamic>> products = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element) {
      Map <String, dynamic> product = element.data() as Map<String, dynamic>;
      product["id"] = element.id;
      products.add(product);
    });

    return products;
  }
}
