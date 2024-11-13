import 'package:flutter/material.dart';
// import 'package:goproapp/screens/dashboard/connection_device.dart';
import 'package:goproapp/screens/mulai_survey.dart';
import '../../models/data_riwayat.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Method to get color based on status
  Color getStatusColor(String status) {
    switch (status) {
      case 'selesai':
        return Colors.green; // Green color for completed status
      case 'belum-selesai':
        return Colors.red; // Red color for not started status
      default:
        return Colors.black; // Default color
    }
  }

  Text getStatusTextSurvey(String status) {
    switch (status) {
      case 'selesai':
        return const Text('Surveyed',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
      case 'belum-selesai':
        return const Text('Not Surveyed',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
      default:
        return const Text('NaN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image Styling
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logoLogin.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 80),

              // Data Table Styling
              DataTable(
                columnSpacing: 40, // Reduced space between columns
                headingRowHeight: 35,
                dataRowMinHeight: 40,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Nama Rute Survei',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Action',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
                rows: dataList.map((data) {
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        data.rute,
                        overflow: TextOverflow.ellipsis, // Handle text overflow
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    DataCell(
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 90, // Fixed width for status box
                          minHeight: 30, // Fixed height for status box
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getStatusColor(data.status),
                            borderRadius: BorderRadius.circular(
                              5,
                            ), // Memberikan lekuk halus
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: getStatusTextSurvey(data.status),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 70,
                        height: 30, // Keep button size consistent
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MulaiSurvey(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Mulai',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
