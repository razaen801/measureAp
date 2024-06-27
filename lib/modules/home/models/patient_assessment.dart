import 'package:measure_ap/common/dummy_data/patients.dart';
import 'package:measure_ap/modules/home/models/patient_details.dart';

class PatientAssessmentDetail {
  int PaId;
  DateTime dateTime;
  int? assessmentId;
  String? cognitionType;
  int? patientId;
  String? applicableMeasures;

  PatientAssessmentDetail({
    required this.PaId,
    required this.dateTime,
    this.assessmentId,
    this.cognitionType,
    this.patientId,
    this.applicableMeasures,
  });

  PatientDetails get patient => allPatient.where((element) => element.patientId == patientId).first;

  factory PatientAssessmentDetail.fromJson(Map<String, dynamic> json) {
    return PatientAssessmentDetail(
      PaId: json['PaId'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      assessmentId: json['assessmentId'] as int,
      cognitionType: json['cognitionType'] as String,
      patientId: json['patientId'] as int,
      applicableMeasures: json['applicableMeasures'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PaId': PaId,
      'dateTime': dateTime.toIso8601String(),
      'assessmentId': assessmentId,
      'cognitionType': cognitionType,
      'patientId': patientId,
      'applicableMeasures': applicableMeasures,
    };
  }

  @override
  String toString() {
    return 'PatientAssessmentDetail(PaId: $PaId, dateTime: $dateTime, assessmentId: $assessmentId, cognitionType: $cognitionType, patientId: $patientId, applicableMeasures: $applicableMeasures)';
  }

  PatientAssessmentDetail copyWith({
    int? PaId,
    DateTime? dateTime,
    int? assessmentId,
    String? cognitionType,
    int? patientId,
    String? applicableMeasures,
    PatientDetails? patientDetails,
  }) {
    return PatientAssessmentDetail(
      PaId: PaId ?? this.PaId,
      dateTime: dateTime ?? this.dateTime,
      assessmentId: assessmentId ?? this.assessmentId,
      cognitionType: cognitionType ?? this.cognitionType,
      patientId: patientId ?? this.patientId,
      applicableMeasures: applicableMeasures ?? this.applicableMeasures,
    );
  }
}
