import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goproapp/models/data_rute_survey.dart';
import 'package:latlong2/latlong.dart';

class MulaiSurvey extends StatefulWidget {
  const MulaiSurvey({super.key});

  @override
  State<MulaiSurvey> createState() => _MulaiSurveyState();
}

class _MulaiSurveyState extends State<MulaiSurvey> {
  List<LatLng> routeCoordinates() => ruteSurvey
      .map((point) => LatLng(point.latitude, point.longitude))
      .toList();

  Timer? _timer;
  int _start = 0;
  int _inputTime = 5;
  final List<int> timeOptions = [5, 10, 15, 20];

  void _startCountdown() {
    if (_timer != null) {
      _timer?.cancel();
    }
    setState(() {
      _start = _inputTime * 60; // Konversi menit ke detik
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Mulai Survey',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Menambahkan padding di sekitar seluruh body
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Survey Jalan',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Garut - Las Vegas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                width: 425,
                height: 225,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.circular(20), // Menambahkan border radius
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Menambahkan border radius
                  child: Image.asset(
                    'assets/images/jalanTest.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Durasi rekaman",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200, // Atur lebar dropdown sesuai kebutuhan
                child: DropdownButton<int>(
                  value: _inputTime,
                  items: timeOptions.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Center(
                        child: Text(
                          '$value menit',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _inputTime = value ?? 0;
                    });
                  },
                  dropdownColor: Colors.white,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: _inputTime > 0 ? _startCountdown : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  child: const Text(
                    'Mulai Survey',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_start > 0)
                Text(
                  'Sisa waktu: ${_start ~/ 60} menit ${_start % 60} detik',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
