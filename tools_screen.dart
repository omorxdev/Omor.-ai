import 'package:flutter/material.dart';
import 'app_shell.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(children: [
    const PageHeader(subtitle: 'AI TOOLBOX'),
    Expanded(child: ListView(padding: const EdgeInsets.all(16), children: const [
      _ToolTile(icon: Icons.search, title: 'Web Research', subtitle: 'Search and summarize trusted sources'),
      _ToolTile(icon: Icons.code, title: 'Code Assistant', subtitle: 'Write, explain and debug code'),
      _ToolTile(icon: Icons.description_outlined, title: 'Document Reader', subtitle: 'Analyze PDF and text documents'),
      _ToolTile(icon: Icons.image_outlined, title: 'Image Understanding', subtitle: 'Ask questions about an image'),
      _ToolTile(icon: Icons.task_alt, title: 'Task Planner', subtitle: 'Break a goal into safe, reviewable steps'),
      _ToolTile(icon: Icons.memory, title: 'Memory Manager', subtitle: 'Review and control saved memories'),
    ])),
  ]);
}

class _ToolTile extends StatelessWidget {
  const _ToolTile({required this.icon, required this.title, required this.subtitle});
  final IconData icon; final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => Card(color: const Color(0xFF141827), child: ListTile(
    leading: CircleAvatar(backgroundColor: const Color(0xFF302B59), child: Icon(icon, color: const Color(0xFFB8AEFF))),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
    subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54)),
    trailing: const Icon(Icons.chevron_right),
  ));
}
