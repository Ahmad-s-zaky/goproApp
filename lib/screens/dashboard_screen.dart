import 'package:flutter/material.dart';
import 'package:goproapp/screens/connection_device.dart';
import 'package:goproapp/screens/view_media_screen.dart';
import 'package:goproapp/screens/mulai_survey.dart';
import 'package:goproapp/screens/survey_screen.dart';
import '../../models/data_riwayat.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDeviceConnection(context);
    });
  }

  // Metode untuk mendapatkan warna berdasarkan status
  Color getStatusColor(String status) {
    switch (status) {
      case 'selesai':
        return Colors.green; // Warna hijau untuk status selesai
      case 'dalam-proses':
        return Colors.yellow; // Warna kuning untuk status dalam proses
      case 'belum-selesai':
        return Colors.red; // Warna merah untuk status belum mulai
      default:
        return Colors.black; // Warna default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logoLogin.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Data Table Styling
              DataTable(
                columnSpacing: 80, // Jarak antar kolom
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 100, // Lebar kolom Mulai
                      child: Text(
                        '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: dataList.map((data) {
                  return DataRow(cells: [
                    DataCell(
                      Row(
                        children: [
                          // Simbol bulat di samping kiri atribut rute
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: getStatusColor(
                                  data.status), // Warna berdasarkan status
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                              width: 5), // Jarak antara simbol dan teks
                          // Memastikan rute memiliki lebar yang cukup
                          Expanded(
                            child: Text(
                              data.rute,
                              overflow: TextOverflow
                                  .ellipsis, // Memotong teks yang terlalu panjang
                              maxLines: 1, // Menetapkan jumlah baris maksimal
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 80,
                        height: 35, // Tetap ukuran untuk tombol Mulai
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            'Mulai',
                            style: TextStyle(
                              fontSize: 12,
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

              const SizedBox(height: 100),

              // Button Group Styling
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurveyScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Survey',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeviceScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'View Media',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
