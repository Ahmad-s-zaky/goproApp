class DataRiwayat {
  final String rute;
  final String status;

  DataRiwayat({required this.rute, required this.status});
}

List<DataRiwayat> dataList = [
  DataRiwayat(rute: 'Bandung - Garut', status: 'selesai'),
  DataRiwayat(rute: 'Garut - Las Vegas', status: 'belum-selesai'),
];
