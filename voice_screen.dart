import 'package:flutter/material.dart';
import 'app_shell.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});
  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  bool listening = false;
  @override
  Widget build(BuildContext context) => Column(children: [
    const PageHeader(subtitle: 'VOICE ASSISTANT'),
    const Spacer(),
    Container(width: 210, height: 210,
      decoration: BoxDecoration(shape: BoxShape.circle,
        gradient: const RadialGradient(colors: [Color(0xFF5E50B8), Color(0xFF151A2B)]),
        boxShadow: [BoxShadow(color: const Color(0xFF8B7CFF).withOpacity(.24), blurRadius: 55, spreadRadius: 8)]),
      child: const Icon(Icons.graphic_eq, size: 88, color: Colors.white)),
    const SizedBox(height: 28),
    Text(listening ? 'শুনছি...' : 'Omor AI Voice', style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8),
    const Text('বাংলা ও English voice conversation', style: TextStyle(color: Colors.white54)),
    const Spacer(),
    Padding(padding: const EdgeInsets.only(bottom: 44), child: FilledButton.icon(
      onPressed: () => setState(() => listening = !listening),
      icon: Icon(listening ? Icons.stop : Icons.mic),
      label: Text(listening ? 'Stop listening' : 'Start voice chat'),
      style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18)),
    )),
  ]);
}
