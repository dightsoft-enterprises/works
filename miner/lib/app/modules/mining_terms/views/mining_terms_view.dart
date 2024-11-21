import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mining_terms_controller.dart';

class MiningTermsView extends GetView<MiningTermsController> {
  const MiningTermsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MiningTermsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MiningTermsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
