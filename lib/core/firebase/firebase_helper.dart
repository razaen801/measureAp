import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../modules/home/models/patient_assessment.dart';
import '../../modules/new_assessment/models/assessment_data.dart';

class FirebaseDatabaseHelper{

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4ErLATsuZqeBUm0Ojyt36Sw_9pY8b-0Y',
    appId: '1:307044284169:android:6df60bd4a23784e13145d8',
    messagingSenderId: '307044284169',
    projectId: 'measureap-bda72',
    storageBucket: 'measureap-bda72.appspot.com',
  );

  static Future<void> writePatientAssessmentDetail(PatientAssessmentDetail detail) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('PatientAssessmentDetails').child(detail.PaId.toString());

    await databaseReference.set(detail.toJson());
  }

  static Future<PatientAssessmentDetail?> readPatientAssessmentDetailById(int paId) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('PatientAssessmentDetails').child(paId.toString());

    DataSnapshot snapshot = await databaseReference.get();

    if (snapshot.exists) {
      return PatientAssessmentDetail.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
    } else {
      return null;
    }
  }

  static Future<List<PatientAssessmentDetail>> readAllPatientAssessmentDetails() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('PatientAssessmentDetails');
    DataSnapshot snapshot = await databaseReference.get();

    List<PatientAssessmentDetail> detailsList = [];
    if (snapshot.exists) {
      Map<String, dynamic> values = Map<String, dynamic>.from(snapshot.value as Map);

      values.forEach((key, value) {
        detailsList.add(PatientAssessmentDetail.fromJson(Map<String, dynamic>.from(value)));
      });
    }

    return detailsList;
  }

  static Future<void> writeAssessmentData(AssessmentData data) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('AssessmentData').child(data.assessmentId.toString());

    await databaseReference.set(data.toJson());
  }

  static Future<AssessmentData?> readAssessmentDataById(int assessmentId) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('AssessmentData').child(assessmentId.toString());

    DataSnapshot snapshot = await databaseReference.get();

    if (snapshot.exists) {
      return AssessmentData.fromJson(Map<String, dynamic>.from(snapshot.value as Map));
    } else {
      return null;
    }

  }

  static Future<List<AssessmentData>> readAllAssessmentData() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('AssessmentData');
    DataSnapshot snapshot = await databaseReference.get();

    List<AssessmentData> dataList = [];
    if (snapshot.exists) {
      Map<String, dynamic> values = Map<String, dynamic>.from(snapshot.value as Map);

      values.forEach((key, value) {
        dataList.add(AssessmentData.fromJson(Map<String, dynamic>.from(value)));
      });
    }

    return dataList;
  }
}