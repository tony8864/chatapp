class Contact {
  final String uid;
  String firstname;
  String lastname;
  String chatId;

  Contact({
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.chatId,
  });

  factory Contact.fromMap(Map<String, dynamic> map, String uid) {
    return Contact(
      uid: uid,
      chatId: map['chatId'],
      firstname: map['firstname'],
      lastname: map['lastname'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'chatId': chatId, 'firstname': firstname, 'lastname': lastname};
  }
}
