import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _client = FirebaseDatabase.instance;

  Future<dynamic> read(String reference) async {
    final snapshot = await _client.ref(reference).get();
    if (snapshot.exists) {
      return snapshot.value;
    }
    return null;
  }

  Future<void> create(String reference,
      {required Map<String, dynamic> data}) async {
    await _client.ref(reference).set(data);
  }
}
