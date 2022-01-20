part of 'helpers.dart';

class DatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorgae = FirebaseStorage.instance;

  Future addKonten({
    required String title,
    required String description,
    required String createby,
    required File image,
  }) async {
    var _timeKey = DateTime.now();

    Reference _ref =
        _firebaseStorgae.ref().child("Kontens/" + _timeKey.toString());

    try {
      UploadTask _uploadTask = _ref.putFile(image);

      TaskSnapshot _downloadUrl = await _uploadTask;

      String _url = await _downloadUrl.ref.getDownloadURL();

      print("Link : " + _url);

      DocumentReference _documentReferencer =
          _firestore.collection("Kontens").doc();

      Map<String, dynamic> _data = Konten(
              title: title,
              description: description,
              image: _url,
              createby: createby)
          .toMap();

      await _documentReferencer
          .set(_data)
          .whenComplete(() => print("Konten Added"));
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> readKontens() {
    CollectionReference _kontensColl = _firestore.collection("Kontens");
    return _kontensColl.snapshots();
  }

  Future<String> updateImage({
    required File image,
    required String netimage,
  }) async {
    String url = "";

    var _timeKey = DateTime.now();

    Reference _ref =
        _firebaseStorgae.ref().child("Kontens/" + _timeKey.toString());

    try {
      UploadTask _uploadTask = _ref.putFile(image);

      TaskSnapshot _downloadUrl = await _uploadTask;

      url = await _downloadUrl.ref.getDownloadURL();

      print("Link : " + url);

      await _firebaseStorgae
          .refFromURL(netimage)
          .delete()
          .whenComplete(
              () => print('Previous Konten image deleted from the storage'))
          .catchError((e) => print(e));
    } catch (e) {
      print(e.toString());
    }
    return url;
  }

  Future updateKonten(
      {required String title,
      required String description,
      required String createby,
      required String netimage,
      required String docID}) async {
    DocumentReference _documentReferencer =
        _firestore.collection("Kontens").doc(docID);

    try {
      Map<String, dynamic> _data = Konten(
              title: title,
              description: description,
              image: netimage,
              createby: createby)
          .toMap();

      await _documentReferencer
          .update(_data)
          .whenComplete(() => print("Konten Updated"));
    } catch (e) {
      print(e);
    }
  }

  Future deleteItem({
    required String docID,
    required String netimage,
  }) async {
    DocumentReference _documentReferencer =
        _firestore.collection("Kontens").doc(docID);

    await _firebaseStorgae
        .refFromURL(netimage)
        .delete()
        .whenComplete(() => print('Konten image deleted from the storage'))
        .catchError((e) => print(e));

    await _documentReferencer
        .delete()
        .whenComplete(() => print('Konten deleted from the database'))
        .catchError((e) => print(e));
  }
}
