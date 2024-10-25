class StreamingData {
  int id = 1;
  double humidity;
  double temperature;
  DateTime internalClock;

  StreamingData({
    required this.humidity,
    required this.temperature,
    required this.internalClock,
  });

  // Conversão de JSON para o objeto
  factory StreamingData.fromJson(Map<String, dynamic> json) {
    return StreamingData(
      humidity: json['humidity'].toDouble(),
      temperature: json['temperature'].toDouble(),
      internalClock: DateTime.parse(json['internalClock']),
    );
  }

  // Conversão do objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'humidity': humidity,
      'temperature': temperature,
      'internalClock': internalClock.toIso8601String(),
    };
  }
}
