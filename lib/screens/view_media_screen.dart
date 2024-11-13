// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ViewMediaScreen extends StatefulWidget {
  const ViewMediaScreen({super.key});

  @override
  State<ViewMediaScreen> createState() => _ViewMediaScreenState();
}

class _ViewMediaScreenState extends State<ViewMediaScreen> {
  List<bool> _selectedRows = [];
  final List<Map<String, String>> _data = [
    {'nama': 'Survei Garut - Bandung', 'status': 'selesai'},
    {'nama': 'Survei Garut - Las Vegas', 'status': 'belum-selesai'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedRows = List<bool>.filled(_data.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'View Media',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            DataTable(
              columns: const [
                DataColumn(label: Text('Nama File')),
                DataColumn(label: Text('Status')),
                // DataColumn(label: Text('Action')),
              ],
              rows: List<DataRow>.generate(
                _data.length,
                (index) => DataRow(
                  selected: _selectedRows[index],
                  onSelectChanged: (bool? selected) {
                    if (selected != null && !selected) {
                      setState(() {
                        _selectedRows[index] = false;
                      });
                    } else {
                      _showSingleActionDialog(_data[index]);
                    }
                  },
                  cells: [
                    DataCell(
                      Text(
                        _data[index]['nama']!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        _showSingleActionDialog(_data[index]);
                      },
                    ),
                    DataCell(
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 90, // Fixed width for status box
                          minHeight: 30, // Fixed height for status box
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getStatusColor(_data[index]['status']!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: getStatusUpload(_data[index]['status']!),
                        ),
                      ),
                    ),
                    // DataCell(
                    //   SizedBox(
                    //     width: 70,
                    //     height: 30, // Keep button size consistent
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.blueAccent,
                    //         padding: const EdgeInsets.symmetric(horizontal: 4),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4),
                    //         ),
                    //       ),
                    //       child: const Text(
                    //         'Upload',
                    //         style: TextStyle(
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text getStatusUpload(String status) {
    switch (status) {
      case 'selesai':
        return const Text(
          'Uploaded',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      case 'belum-selesai':
        return const Text(
          'Not Uploaded',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
      default:
        return const Text(
          'NaN',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        );
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'selesai':
        return Colors.green;
      case 'belum-selesai':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  void _showSingleActionDialog(Map<String, String> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${data['nama']}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Apa Anda yakin untuk upload file ini?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _uploadData(data);
              },
              child: const Text(
                'Upload',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  void _uploadData(Map<String, String> data) {
    // Logika untuk upload
    print('Uploading data: ${data['nama']}');
  }
}
