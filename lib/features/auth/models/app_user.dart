class AppUser {
  final String uid;
  final String firstname;
  final String lastname;

  AppUser({required this.uid, required this.firstname, required this.lastname});

  factory AppUser.fromMap(Map<String, dynamic> map, String uid) {
    return AppUser(uid: uid, firstname: map['firstname'], lastname: map['lastname']);
  }

  Map<String, dynamic> toMap() {
    return {'firstname': firstname, 'lastname': lastname};
  }
}
