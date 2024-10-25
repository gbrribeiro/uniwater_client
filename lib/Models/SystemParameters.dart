class SystemParameters {
  int id = 1;
  int humidityOffPercentage;
  int humidityOnPercentage;
  double dangerousTemperature;

  SystemParameters({
    required this.humidityOffPercentage,
    required this.humidityOnPercentage,
    required this.dangerousTemperature,
  });

  // Conversão de JSON para o objeto
  factory SystemParameters.fromJson(Map<String, dynamic> json) {
    return SystemParameters(
      humidityOffPercentage: json['humidityOffPercentage'],
      humidityOnPercentage: json['humidityOnPercentage'],
      dangerousTemperature: json['dangerousTemperature'].toDouble(),
    );
  }

  // Conversão do objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'humidityOffPercentage': humidityOffPercentage,
      'humidityOnPercentage': humidityOnPercentage,
      'dangerousTemperature': dangerousTemperature,
    };
  }
}
