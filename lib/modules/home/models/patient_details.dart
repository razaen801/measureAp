class PatientDetails{
  int patientId;
  String? name;
  String? gender;
  String? dob;
  double? weight;
  String? phone;
  String? address;

  PatientDetails({
    required this.patientId,
    this.name,
    this.gender,
    this.dob,
    this.weight,
    this.phone,
    this.address,
  });

  String get patientSearchName => '$patientId - $name';

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
      patientId: json['patientId'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      weight: json['weight'] as double,
      phone: json['phone'] as String,
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'name': name,
      'gender': gender,
      'dob': dob,
      'weight': weight,
      'phone': phone,
      'address': address,
    };
  }

  @override
  String toString() {
    return 'PatientDetails(patientId: $patientId, name: $name, gender: $gender, dob: $dob, weight: $weight, phone: $phone, address: $address)';
  }

  PatientDetails copyWith({
    int? patientId,
    String? name,
    String? gender,
    String? dob,
    double? weight,
    String? phone,
    String? address,
  }) {
    return PatientDetails(
      patientId: patientId ?? this.patientId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      weight: weight ?? this.weight,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}