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

  Stream<dynamic> listen(String reference) {
    return _client.ref(reference).onValue.distinct().map((DatabaseEvent event) {
      if (event.snapshot.exists) {
        return event.snapshot.value;
      } else {
        return null;
      }
    });
  }

  Future<void> create(String reference,
      {required Map<String, dynamic> data}) async {
    await _client.ref(reference).set(data);
  }

  void update(String reference, {required Map<String, dynamic> data}) async {
    await _client.ref(reference).update(data);
  }
}
