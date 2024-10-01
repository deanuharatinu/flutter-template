import 'package:flutter/material.dart';

class EnvSecurityDialog extends StatefulWidget {
  const EnvSecurityDialog({super.key});

  @override
  State<EnvSecurityDialog> createState() => _EnvSecurityDialogState();
}

class _EnvSecurityDialogState extends State<EnvSecurityDialog> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(this.context).pop(true);
      }
    });

    return const AlertDialog(
      title: Text('Device root / jailbreak'),
      content: Text(
        'Aplikasi tidak dapat berjalan di device Anda. Aplikasi akan segera ditutup.',
      ),
    );
  }
}
