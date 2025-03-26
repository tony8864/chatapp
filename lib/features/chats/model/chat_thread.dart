import 'package:chatapp/features/chats/model/participant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatThread {
  final String id;
  final List<Participant> participants;
  final String lastMessage;
  final DateTime lastUpdated;

  ChatThread({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.lastUpdated,
  });

  factory ChatThread.fromMap(Map<String, dynamic> map, String id) {
    return ChatThread(
      id: id,
      participants: List<Participant>.from(map['participants']),
      lastMessage: map['lastMessage'] ?? '',
      lastUpdated: (map['lastUpdated'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'participants': participants.map((p) => p.toMap()).toList(),
      'lastMessage': lastMessage,
      'lastUpdated': Timestamp.fromDate(lastUpdated),
    };
  }
}
