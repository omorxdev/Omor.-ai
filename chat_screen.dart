import 'package:flutter/material.dart';
import 'app_shell.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  final messages = <({String text, bool mine})>[];

  void send() {
    final value = controller.text.trim();
    if (value.isEmpty) return;
    setState(() {
      messages.add((text: value, mine: true));
      messages.add((text: 'আমি প্রস্তুত। AI backend যুক্ত হলে এখানে উত্তর দেখাব।', mine: false));
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
    const PageHeader(subtitle: 'ONLINE UI PREVIEW'),
    Expanded(child: messages.isEmpty
      ? Center(child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 92, height: 92,
              decoration: BoxDecoration(shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: const Color(0xFF8B7CFF).withOpacity(.25), blurRadius: 40)],
                gradient: const RadialGradient(colors: [Color(0xFF51469A), Color(0xFF171B30)])),
              child: const Icon(Icons.auto_awesome, size: 42, color: Colors.white)),
            const SizedBox(height: 24),
            const Text('কীভাবে সাহায্য করতে পারি?', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('প্রশ্ন করো, আইডিয়া দাও অথবা কোনো কাজের পরিকল্পনা করতে বলো।',
              textAlign: TextAlign.center, style: TextStyle(color: Colors.white54)),
          ]),
        ))
      : ListView.builder(padding: const EdgeInsets.all(16), itemCount: messages.length,
          itemBuilder: (context, i) {
            final m = messages[i];
            return Align(alignment: m.mine ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
                constraints: const BoxConstraints(maxWidth: 310),
                decoration: BoxDecoration(color: m.mine ? const Color(0xFF51469A) : const Color(0xFF171C2B),
                  borderRadius: BorderRadius.circular(18)),
                child: Text(m.text)));
          })),
    Padding(padding: const EdgeInsets.fromLTRB(14, 8, 14, 14), child: Row(children: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
      Expanded(child: TextField(controller: controller, minLines: 1, maxLines: 5,
        onSubmitted: (_) => send(), decoration: const InputDecoration(hintText: 'Omor AI-কে কিছু জিজ্ঞেস করো...'))),
      const SizedBox(width: 8),
      IconButton.filled(onPressed: send, icon: const Icon(Icons.arrow_upward)),
    ])),
  ]);
}
