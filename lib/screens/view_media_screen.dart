// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:goproapp/models/media_list.dart';
// import 'package:goproapp/screens/view_media/upload_media_screen.dart';
import 'package:http/http.dart' as http;

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  Map<int, bool> isLoadingMap = {};

  // Daftar media sebagai contoh
  final List<MediaList> mediaList = [
    MediaList(nama: "Media 1"),
    MediaList(nama: "Media 2"),
    MediaList(nama: "Media 3"),
    MediaList(nama: "Media 4"),
    MediaList(nama: "Media 5"),
  ];

  Future<void> pushData(int index) async {
    setState(() {
      isLoadingMap[index] = true;
    });
    try {
      var url = Uri.parse('BaseURL/data');
      var response = await http.post(url, body: {
        'key': 'value',
      });
      if (response.statusCode == 200) {
        print('Data telah di upload');
      } else {
        print('Gagal di upload');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        isLoadingMap[index] = false;
      });
    }
  }

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
            Center(
              child: DataTable(
                columnSpacing: 230,
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
                rows: List<DataRow>.generate(mediaList.length, (index) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            mediaList[index].nama,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 90, // Lebar tombol yang lebih kecil
                          height: 30, // Tinggi tombol yang lebih kecil
                          child: ElevatedButton(
                            onPressed: isLoadingMap[index] == true
                                ? null // Matikan tombol saat loading
                                : () => pushData(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: isLoadingMap[index] == true
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Upload',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
