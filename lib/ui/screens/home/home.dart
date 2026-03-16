import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home_welcome_back),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
