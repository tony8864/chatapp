class Participant {
  final String id;
  final String name;

  Participant({required this.id, required this.name});

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(id: map['id'], name: map['name']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}
