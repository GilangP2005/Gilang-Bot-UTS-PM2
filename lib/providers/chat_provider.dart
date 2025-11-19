import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/message.dart';

// StateNotifier: Kelas yang mengelola state (daftar pesan)
class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super([
    // Pesan awal/mock data untuk tampilan
    Message(text: "Halo! Saya Gilang Bot. Silakan coba tanyakan tentang 'Layouting' atau '1+1 berapa'!", isUser: false, timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
  ]);

  // Data Tiruan (Mock Data) untuk Pertanyaan-Jawaban
  String getBotResponse(String query) {
    final lowerCaseQuery = query.toLowerCase();

    // Jawaban UTS Sebelumnya
    if (lowerCaseQuery.contains('layouting') || lowerCaseQuery.contains('layout')) {
      return "Layouting adalah fokus utama UTS Anda. Anda harus menggunakan berbagai Widget seperti Row, Column, ListView.builder, dan Container untuk menunjukkan kreativitas Anda. Layouting memiliki bobot nilai terbesar!";
    } else if (lowerCaseQuery.contains('state management') || lowerCaseQuery.contains('riverpod') || lowerCaseQuery.contains('bloc') || lowerCaseQuery.contains('getx')) {
      return "State Management sederhana seperti BLoC, Riverpod, atau GetX adalah penyempurna nilai. Fokuskan pada cara mengelola list pesan, dan abaikan fitur kompleks.";
    } else if (lowerCaseQuery.contains('uts') || lowerCaseQuery.contains('deadline') || lowerCaseQuery.contains('kumpul')) {
      return "Pengumpulan hanya via sistem kampus. Deadline pengumpulan mengikuti jadwal UTS masing-masing kelas. UTS ini fokusnya akan ada di layouting aplikasi.";
    
    // PERTANYAAN BARU TAMBAHAN
    } else if (lowerCaseQuery.contains('1+1') || lowerCaseQuery.contains('satu tambah satu')) {
      return "1 + 1 adalah 2. Saya Gilang Bot, dan saya ahli dalam perhitungan dasar!";
    } else if (lowerCaseQuery.contains('penemu lampu') || lowerCaseQuery.contains('lampu')) {
      return "Thomas Alva Edison sering disebut sebagai penemu lampu pijar yang sukses secara komersial, meskipun banyak penemu lain yang berkontribusi pada pengembangan teknologi ini.";
    } else if (lowerCaseQuery.contains('pemograman web') || lowerCaseQuery.contains('web')) {
      return "Pemrograman web adalah proses pembuatan aplikasi dan situs web yang berjalan melalui internet, biasanya melibatkan bahasa seperti HTML, CSS, JavaScript, dan framework backend (Ini adalah mock data).";
    } else {
      return "Maaf, saya Gilang Bot, dan saya hanya dilatih untuk menjawab pertanyaan seputar tugas Pemrograman Mobile 2 Anda dan beberapa pengetahuan umum terbatas. Mohon tanyakan hal lain terkait Layouting, State Management, atau ketentuan UTS.";
    }
  }

  // Fungsi untuk menambahkan pesan dari pengguna dan simulasi balasan Bot
  void addMessage(String text) {
    final userMessage = Message(text: text, isUser: true, timestamp: DateTime.now());
    // Update State (menambahkan pesan user)
    state = [...state, userMessage];
    
    // Dapatkan Jawaban Spesifik
    final responseText = getBotResponse(text);

    // Simulasi penundaan balasan (1 detik)
    Future.delayed(const Duration(milliseconds: 1000), () {
      final botResponse = Message(text: responseText, isUser: false, timestamp: DateTime.now());
      // Update State (menambahkan balasan bot)
      state = [...state, botResponse];
    });
  }
}

// Provider: Objek yang diakses oleh Widget
final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) {
  return ChatNotifier();
});