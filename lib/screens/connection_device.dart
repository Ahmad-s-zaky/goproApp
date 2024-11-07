import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

Future<void> showDeviceConnection(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Sambungkan ke GoPro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tolong aktifkan sambungan WiFi Anda untuk dihubungkan dengan GoPro.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await WiFiForIoTPlugin.setEnabled(
                  true,
                  shouldOpenSettings: true,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Aktifkan WiFi',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // WiFiForIoTPlugin.connect('GoPro_Hotspot_SSID');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Sambungkan ke GoPro',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: TextButton(
              child: const Text(
                'Lanjut ke Dashboard',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
          ),
        ],
      );
    },
  );
}
