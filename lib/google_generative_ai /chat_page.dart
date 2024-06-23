import 'package:flutter/material.dart';
import 'package:flutter_learn/core/common.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final List<String> _messages = [];
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: 'AIzaSyDAZGKS2XaIr7hYlbRNgV5cca07HKwX4iw',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    final input = _controller.text;
    _controller.clear();
    setState(() {
      _messages.add('User: $input');
    });
    final response = await model.generateContent([Content.text(input)]);
    setState(() {
      _messages.add('AI: ${response.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_messages[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextFormField(
                      controller: _controller,
                      hint: "Type your message here...",
                      onValidate: (p0) {},
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
