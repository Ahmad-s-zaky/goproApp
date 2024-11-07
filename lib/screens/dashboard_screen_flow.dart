import 'package:flutter/material.dart';
import 'connection_device.dart';

class GoToDashboard extends StatelessWidget {
  const GoToDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDeviceConnection(context);
          },
          child: const Text("Go to Dashboard"),
        ),
      ),
    );
  }
}
