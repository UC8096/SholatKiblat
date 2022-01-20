part of 'controllers.dart';

class KontenController extends GetxController {
  final _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  User? _curUser;

  var isViewer = false.obs, isCreator = false.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      bool _everLogin = false;

      _everLogin = await userChecker();

      if (!_everLogin) {
        DocumentReference _documentReferencer =
            _firestore.collection("Users").doc(_user!.id);

        Map<String, dynamic> _data = UserApp(
                uid: _user!.id,
                email: _user!.email,
                isCreator: false,
                isViewer: true,
                name: _user!.displayName)
            .toMap();

        _documentReferencer.set(_data).whenComplete(() => print("User Added"));
      }

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    update();
  }

  Future<bool> userChecker() async {
    bool _everLogin = false;

    var _usersCollection = _firestore.collection("Users");

    var _querySnapshot = await _usersCollection.get();

    for (var _queryDocSnapshot in _querySnapshot.docs) {
      Map<String, dynamic>? _data = _queryDocSnapshot.data();

      UserApp _userApp = UserApp.fromMap(_data);

      if (_userApp.uid == _user?.id || _userApp.uid == _curUser?.uid) {
        _everLogin = true;
        if (_userApp.isViewer == true) {
          isViewer.value = true;
        }
        if (_userApp.isCreator == true) {
          isCreator.value = true;
        }
      }
      update();
    }
    return _everLogin;
  }

  Future logout() async {
    await _googleSignIn.disconnect();

    FirebaseAuth.instance.signOut();

    isCreator.value = false;
    isViewer.value = false;

    update();
  }

  @override
  Future<void> onInit() async {
    _curUser = _auth.currentUser;
    _user = _googleSignIn.currentUser;

    _user ??= await _googleSignIn.signInSilently();

    await userChecker();
    super.onInit();
  }

  var netimage = "".obs, title = "".obs, desc = "".obs, docID = "".obs;

  var argumenttitle = "".obs,
      argumentdesc = "".obs,
      argumentimage = "".obs,
      argumentdocID = "".obs,
      argumentisCreator = false.obs;

  final addItemFormKey = GlobalKey<FormState>();

  var isProcessing = false.obs;

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final DatabaseHelper databaseHelper = DatabaseHelper();

  Stream<QuerySnapshot> fetchKonten = DatabaseHelper().readKontens();

  File? image;
  String? imagePath;
  final _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      update();
    } else {
      print('No image selected.');
    }
  }
}
