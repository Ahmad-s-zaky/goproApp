import 'package:flutter/material.dart';

class ViewMediaScreen extends StatefulWidget {
  const ViewMediaScreen({super.key});

  @override
  State<ViewMediaScreen> createState() => _ViewMediaScreenState();
}

class _ViewMediaScreenState extends State<ViewMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('View Media'),
          ],
        ),
      ),
    );
  }
}