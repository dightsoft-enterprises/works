import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../l10n/app_localizations.dart';
import '../controllers/signal_level2_controller.dart';

class SignalLevel2View extends GetView<SignalLevel2Controller> {
  const SignalLevel2View({super.key});
  @override
  Widget build(BuildContext context) {
    var appLocalization =  AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignalLevel2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignalLevel2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
