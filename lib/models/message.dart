class Message {
  final String text;
  final bool isUser; // True jika pesan dari pengguna, False jika dari Gilang Bot
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}