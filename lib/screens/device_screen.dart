import 'package:flutter/material.dart';
import 'package:goproapp/models/media_list.dart';
import 'package:goproapp/screens/view_media_screen.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Tambahkan margin di sekitar konten
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Media List",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            DataTable(
              columnSpacing: 40,
              columns: const [
                DataColumn(
                  label: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: deviceList.map((data) {
                return DataRow(
                  cells: [
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          data.nama,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 70, // Lebar tombol yang lebih kecil
                        height: 30, // Tinggi tombol yang lebih kecil
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewMediaScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Upload',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12, // Ukuran font yang lebih kecil
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
