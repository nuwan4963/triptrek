import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collections
  CollectionReference get _users => _db.collection('users');
  CollectionReference get _destinations => _db.collection('destinations');
  CollectionReference get _bookings => _db.collection('bookings');

  // USER DATA
  Future<void> saveUser(String uid, Map<String, dynamic> userData) async {
    await _users.doc(uid).set(userData, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _users.doc(uid).get();
    return doc.data() as Map<String, dynamic>?;
  }

  // DESTINATIONS
  Stream<List<Map<String, dynamic>>> getDestinations() {
    return _destinations.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  // BOOKINGS
  Future<void> createBooking(String uid, Map<String, dynamic> bookingData) async {
    await _bookings.add({
      ...bookingData,
      'userId': uid,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
