import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'voice_screen.dart';
import 'tools_screen.dart';
import 'settings_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;
  final pages = const [
    ChatScreen(),
    VoiceScreen(),
    ToolsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: const Color(0xFF101522),
        indicatorColor: const Color(0xFF302B59),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.graphic_eq), label: 'Voice'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), label: 'Tools'),
          NavigationDestination(icon: Icon(Icons.tune), label: 'Settings'),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
    child: Row(children: [
      Container(
        width: 42, height: 42,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF8B7CFF), Color(0xFF42C9C0)]),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.auto_awesome, color: Colors.white),
      ),
      const SizedBox(width: 12),
      const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('DEVELOPER OMOR AI', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: .5)),
        Text('Your personal intelligence', style: TextStyle(color: Colors.white54, fontSize: 12)),
      ])),
      const Icon(Icons.circle, color: Color(0xFF55D6BE), size: 9),
      const SizedBox(width: 6),
      Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 11)),
    ]),
  );
}
