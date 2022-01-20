part of 'models.dart';

class KontenApp {
  KontenApp({
    this.users,
    this.kontens,
  });

  Users? users;
  Kontens? kontens;

  KontenApp copyWith({
    Users? users,
    Kontens? kontens,
  }) =>
      KontenApp(
        users: users ?? this.users,
        kontens: kontens ?? this.kontens,
      );

  factory KontenApp.fromJson(String str) => KontenApp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KontenApp.fromMap(Map<String, dynamic> json) => KontenApp(
        users: Users.fromMap(json["users"]),
        kontens: Kontens.fromMap(json["kontens"]),
      );

  Map<String, dynamic> toMap() => {
        "users": users!.toMap(),
        "kontens": kontens!.toMap(),
      };
}

class Kontens {
  Kontens({
    this.konten,
  });

  List<Konten>? konten;

  Kontens copyWith({
    List<Konten>? konten,
  }) =>
      Kontens(
        konten: konten ?? this.konten,
      );

  factory Kontens.fromJson(String str) => Kontens.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kontens.fromMap(Map<String, dynamic> json) => Kontens(
        konten: List<Konten>.from(json["konten"].map((x) => Konten.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "konten": List<dynamic>.from(konten!.map((x) => x.toMap())),
      };
}

class Konten {
  Konten({
    this.title,
    this.description,
    this.image,
    this.createby,
  });

  String? title;
  String? description;
  String? image;
  String? createby;

  Konten copyWith({
    String? title,
    String? description,
    String? image,
    String? createby,
  }) =>
      Konten(
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        createby: createby ?? this.createby,
      );

  factory Konten.fromJson(String str) => Konten.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Konten.fromMap(Map<String, dynamic> json) => Konten(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        createby: json["createby"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "image": image,
        "createby": createby,
      };
}

class Users {
  Users({
    this.userApp,
  });

  List<UserApp>? userApp;

  Users copyWith({
    List<UserApp>? userApp,
  }) =>
      Users(
        userApp: userApp ?? this.userApp,
      );

  factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userApp:
            List<UserApp>.from(json["userApp"].map((x) => UserApp.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userApp": List<dynamic>.from(userApp!.map((x) => x.toMap())),
      };
}

class UserApp {
  UserApp({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.isCreator,
    this.isViewer,
  });

  String? uid;
  String? name;
  String? email;
  String? password;
  bool? isCreator;
  bool? isViewer;

  UserApp copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
    bool? isCreator,
    bool? isViewer,
  }) =>
      UserApp(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        isCreator: isCreator ?? this.isCreator,
        isViewer: isViewer ?? this.isViewer,
      );

  factory UserApp.fromJson(String str) => UserApp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserApp.fromMap(Map<String, dynamic> json) => UserApp(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isCreator: json["isCreator"],
        isViewer: json["isViewer"],
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "isCreator": isCreator,
        "isViewer": isViewer,
      };
}
