import 'package:flutter/material.dart';

class ProcessingPage extends StatelessWidget {
  const ProcessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Payment is processing"),
          ],
        ),
      ),
    );
  }
}
