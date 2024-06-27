import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:measure_ap/common/dummy_data/patients.dart';
import 'package:measure_ap/common/widgets/custom_toolbar.dart';
import 'package:measure_ap/modules/patients/widgets/patient_list_item.dart';

import '../../../common/widgets/global_text_widget.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: GlobalTextWidget.hugeTitle("Patients",textAlign: TextAlign.left,),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: allPatient.length,
                itemBuilder: (context, index) {
                  return PatientListItem(
                    detail: allPatient[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
