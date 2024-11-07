import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:goproapp/models/data_rute_survey.dart';
import 'package:latlong2/latlong.dart';

class MulaiSurvey extends StatefulWidget {
  const MulaiSurvey({super.key});

  @override
  State<MulaiSurvey> createState() => _MulaiSurveyState();
}

class _MulaiSurveyState extends State<MulaiSurvey> {
  // bool isRouteStarted = false;

  // Konversi data ruteSurvey ke dalam format LatLng
  List<LatLng> routeCoordinates() => ruteSurvey
      .map((point) => LatLng(point.latitude, point.longitude))
      .toList();

  // void _startRoute() {
  //   setState(() {
  //     isRouteStarted = true; // Menandakan rute sudah dimulai
  //   });
  // }

  Timer? _timer;
  int _start = 0;
  int _inputTime = 0;

  void _startCountdown() {
    if (_timer != null) {
      _timer?.cancel();
    }
    setState(() {
      _start = _inputTime;
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
      appBar: AppBar(
        title: const Text('Mulai Survey'),
      ),
      body: Center(
        child: Column(
          children: [
            // Peta
            // Expanded(
            //   child: FlutterMap(
            //     options: MapOptions(
            //       center: routeCoordinates().isNotEmpty
            //           ? routeCoordinates()[0]
            //           : const LatLng(-6.928, 107.633),
            //       zoom: 17.0,
            //     ),
            //     children: [
            //       TileLayer(
            //         urlTemplate:
            //             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            //         subdomains: const ['a', 'b', 'c'],
            //       ),
            //       PolylineLayer(
            //         polylines: [
            //           Polyline(
            //             points: routeCoordinates(),
            //             strokeWidth: 4.0,
            //             color: Colors.red,
            //           ),
            //         ],
            //       ),
            //       MarkerLayer(
            //         markers: [
            //           Marker(
            //             width: 80.0,
            //             height: 80.0,
            //             point: routeCoordinates().isNotEmpty
            //                 ? routeCoordinates()[0]
            //                 : const LatLng(-6.928, 107.633),
            //             builder: (ctx) => const Icon(
            //               // Ubah icon
            //               Icons.location_on,
            //               color: Colors.black,
            //               size: 40,
            //             ),
            //           ),

            //           // Titik Akhir
            //           // Marker(
            //           //   width: 80.0,
            //           //   height: 80.0,
            //           //   point: routeCoordinates().isNotEmpty
            //           //       ? routeCoordinates()[0]
            //           //       : const LatLng(-6.9293892, 107.6266744),
            //           //   builder: (ctx) => const Icon(
            //           //     Icons.location_on,
            //           //     color: Colors.black,
            //           //     size: 40,
            //           //   ),
            //           if (routeCoordinates().isNotEmpty)
            //             Marker(
            //               width: 80.0,
            //               height: 80.0,
            //               point: routeCoordinates().last,
            //               builder: (ctx) => const Icon(
            //                 Icons.location_on,
            //                 color: Colors.black,
            //                 size: 40,
            //               ),
            //             ), // ),
            //         ],
            //       ),

            //     ],
            //   ),
            // ),
            // Button untuk memulai rute
            const SizedBox(height: 50),
            Container(
              width: 355,
              height: 235,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ClipRect(
                child: Image.asset(
                  'assets/images/jalanTest.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _inputTime = int.tryParse(value) ?? 0; // Atur input waktu
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _inputTime > 0 ? _startCountdown : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  // foregroundColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
