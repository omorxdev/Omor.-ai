import 'package:flutter/material.dart';
import 'app_shell.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(children: [
    const PageHeader(subtitle: 'CONFIGURATION'),
    Expanded(child: ListView(padding: const EdgeInsets.all(16), children: const [
      _SettingTile(icon: Icons.smart_toy_outlined, title: 'AI Model', subtitle: 'Choose model via secure backend'),
      _SettingTile(icon: Icons.volume_up_outlined, title: 'Voice & Language', subtitle: 'Bangla / English, voice preferences'),
      _SettingTile(icon: Icons.key_outlined, title: 'Owner Unlock', subtitle: 'Activate owner tools with server verification'),
      _SettingTile(icon: Icons.storage_outlined, title: 'Data & Memory', subtitle: 'Export, clear and manage local data'),
      _SettingTile(icon: Icons.shield_outlined, title: 'Privacy & Security', subtitle: 'Permissions, device access and safety'),
      _SettingTile(icon: Icons.info_outline, title: 'About', subtitle: 'DEVELOPER OMOR AI • Starter 0.1.0'),
    ])),
  ]);
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.icon, required this.title, required this.subtitle});
  final IconData icon; final String title; final String subtitle;
  @override
  Widget build(BuildContext context) => Card(color: const Color(0xFF141827), child: ListTile(
    leading: Icon(icon, color: const Color(0xFFB8AEFF)),
    title: Text(title), subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54)),
    trailing: const Icon(Icons.chevron_right),
  ));
}
