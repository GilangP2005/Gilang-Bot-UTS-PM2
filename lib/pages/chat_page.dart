import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/message.dart';
import '../providers/chat_provider.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatProvider);
    final textController = TextEditingController();

    // Widget untuk membangun Gelembung Chat (Layouting Kunci)
    Widget buildMessageBubble(Message message) {
      final alignment = message.isUser ? Alignment.centerRight : Alignment.centerLeft;
      final color = message.isUser ? Colors.cyan.shade600 : Colors.grey.shade300;
      final textColor = message.isUser ? Colors.white : Colors.black;
      
      return Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7, 
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                // Sudut Asimetris
                bottomLeft: message.isUser ? const Radius.circular(15) : const Radius.circular(0),
                bottomRight: message.isUser ? const Radius.circular(0) : const Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              message.text,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Row(
          children: [
            Icon(Icons.auto_fix_high, color: Colors.white),
            SizedBox(width: 8),
            Text('Gilang Bot', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Layouting: Daftar Pesan menggunakan Expanded dan ListView.builder
          Expanded(
            child: ListView.builder(
              reverse: true, // Mulai dari bawah
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index]; 
                return buildMessageBubble(message);
              },
            ),
          ),
          
          // Layouting: Input Area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Ketik pertanyaan Anda...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Tombol Kirim
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      // Akses State Management (Riverpod)
                      ref.read(chatProvider.notifier).addMessage(textController.text);
                      textController.clear();
                    }
                  },
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}