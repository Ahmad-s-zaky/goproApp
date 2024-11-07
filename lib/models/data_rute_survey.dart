class DataRuteSurvey {
  final double latitude;
  final double longitude;

  DataRuteSurvey({required this.latitude, required this.longitude});
}

List<DataRuteSurvey> ruteSurvey = [
  // Titik Awal
  DataRuteSurvey(latitude: -6.928, longitude: 107.633), // Titik Awal

  // Jalur Rute
  DataRuteSurvey(latitude: -6.9275532, longitude: 107.6330561),
  DataRuteSurvey(latitude: -6.9270399, longitude: 107.6331627),
  DataRuteSurvey(latitude: -6.9264434, longitude: 107.6333307),
  DataRuteSurvey(latitude: -6.9261669, longitude: 107.6331501),
  DataRuteSurvey(latitude: -6.9258155, longitude: 107.6324879),
  DataRuteSurvey(latitude: -6.9256005, longitude: 107.6316455),
  DataRuteSurvey(latitude: -6.9253494, longitude: 107.6307532),
  DataRuteSurvey(latitude: -6.9250853, longitude: 107.6298472),
  DataRuteSurvey(latitude: -6.9248867, longitude: 107.6290285),
  DataRuteSurvey(latitude: -6.9247482, longitude: 107.6284347),
  DataRuteSurvey(
      latitude: -6.9247273,
      longitude: 107.6280722), // Menghilangkan nilai yang tidak sesuai
  DataRuteSurvey(latitude: -6.9246994, longitude: 107.627916),
  DataRuteSurvey(latitude: -6.9252916, longitude: 107.6276128),
  DataRuteSurvey(latitude: -6.9260894, longitude: 107.6273963),
  DataRuteSurvey(latitude: -6.9268917, longitude: 107.6272032),
  DataRuteSurvey(latitude: -6.927668, longitude: 107.6269725),
  DataRuteSurvey(latitude: -6.9285705, longitude: 107.6267912),
  DataRuteSurvey(latitude: -6.9292811, longitude: 107.6266502),

  // Titik Akhir
  DataRuteSurvey(latitude: -6.9293892, longitude: 107.6266744),
];
