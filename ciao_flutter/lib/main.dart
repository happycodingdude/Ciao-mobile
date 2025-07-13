import 'package:ciao_flutter/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(const ChatApp());

class ChatApp extends StatelessWidget {
  static const appTitle = 'Chat App';

  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChatPage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
