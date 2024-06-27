import 'package:flutter/material.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/colors_sizes.dart';

class AssessmentData {
  int assessmentId;
  bool? isCorrectFingers;
  bool? hasIdentifiedChicken;
  bool? hasIdentifiedHorse;
  bool? hasIdentifiedDog;
  bool? boughtCandies;
  bool? tookCab;
  bool? hasDog;
  bool? recalledSentence;

  AssessmentData({
    required this.assessmentId,
    this.isCorrectFingers,
    this.hasIdentifiedChicken,
    this.hasIdentifiedHorse,
    this.hasIdentifiedDog,
    this.boughtCandies,
    this.tookCab,
    this.hasDog,
    this.recalledSentence,
  });

  int getAnimalCorrectCount() {
    int score = 0;
    if (hasIdentifiedChicken != null && hasIdentifiedChicken!) {
      score++;
    }
    if (hasIdentifiedHorse != null && hasIdentifiedHorse!) {
      score++;
    }
    if (hasIdentifiedDog != null && hasIdentifiedDog!) {
      score++;
    }
    return score;
  }

  int getScore() {
    int score = 0;
    if (isCorrectFingers != null && isCorrectFingers!) {
      score++;
    }
    if (hasIdentifiedChicken != null && hasIdentifiedChicken!) {
      score++;
    }
    if (hasIdentifiedHorse != null && hasIdentifiedHorse!) {
      score++;
    }
    if (hasIdentifiedDog != null && hasIdentifiedDog!) {
      score++;
    }
    if (boughtCandies != null && boughtCandies!) {
      score++;
    }
    if (tookCab != null && tookCab!) {
      score++;
    }
    if (hasDog != null && hasDog!) {
      score++;
    }

    return score * 3;
  }

  Widget getQuestionAnswerList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.black12,
          ),
          _getListWidget(1,isCorrectFingers),
          _getListWidget(2, boughtCandies),
          _getListWidget(3, tookCab),
          _getListWidget(4, hasDog),
          SizedBox(height: 10,),
          GlobalTextWidget.content(
            "Show all",
            textColor: orangeTips,
            isBold: true,
          ),
        ],
      ),
    );
  }

  _getListWidget(int index, bool? value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlobalTextWidget.title(
            "Question $index",
            isBold: false,
            textColor: Colors.black87,
          ),
          GlobalTextWidget.title(
            isBold: true,
            isTrue(value) ? "Correct" : "Incorrect",
            textColor: isTrue(value) ? greenProgress : redWarning,
          ),
        ],
      ),
    );
  }

  bool isTrue(bool? value) {
    return value != null && value;
  }

  factory AssessmentData.fromJson(Map<String, dynamic> json) {
    return AssessmentData(
      assessmentId: json['assessmentId'] as int,
      isCorrectFingers: json['isCorrectFingers'] as bool?,
      hasIdentifiedChicken: json['hasIdentifiedChicken'] as bool?,
      hasIdentifiedHorse: json['hasIdentifiedHorse'] as bool?,
      hasIdentifiedDog: json['hasIdentifiedDog'] as bool?,
      boughtCandies: json['boughtCandies'] as bool?,
      tookCab: json['tookCab'] as bool?,
      hasDog: json['hasDog'] as bool?,
      recalledSentence: json['recalledSentence'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assessmentId': assessmentId,
      'isCorrectFingers': isCorrectFingers,
      'hasIdentifiedChicken': hasIdentifiedChicken,
      'hasIdentifiedHorse': hasIdentifiedHorse,
      'hasIdentifiedDog': hasIdentifiedDog,
      'boughtCandies': boughtCandies,
      'tookCab': tookCab,
      'hasDog': hasDog,
      'recalledSentence': recalledSentence,
    };
  }

  @override
  String toString() {
    return 'AssessmentData(assessmentId: $assessmentId, isCorrectFingers: $isCorrectFingers, hasIdentifiedChicken: $hasIdentifiedChicken, hasIdentifiedHorse: $hasIdentifiedHorse, hasIdentifiedDog: $hasIdentifiedDog, boughtCandies: $boughtCandies, tookCab: $tookCab, hasDog: $hasDog, recalledSentence: $recalledSentence)';
  }

  AssessmentData copyWith({
    int? assessmentId,
    bool? isCorrectFingers,
    bool? hasIdentifiedChicken,
    bool? hasIdentifiedHorse,
    bool? hasIdentifiedDog,
    bool? boughtCandies,
    bool? tookCab,
    bool? hasDog,
    bool? recalledSentence,
  }) {
    return AssessmentData(
      assessmentId: assessmentId ?? this.assessmentId,
      isCorrectFingers: isCorrectFingers ?? this.isCorrectFingers,
      hasIdentifiedChicken: hasIdentifiedChicken ?? this.hasIdentifiedChicken,
      hasIdentifiedHorse: hasIdentifiedHorse ?? this.hasIdentifiedHorse,
      hasIdentifiedDog: hasIdentifiedDog ?? this.hasIdentifiedDog,
      boughtCandies: boughtCandies ?? this.boughtCandies,
      tookCab: tookCab ?? this.tookCab,
      hasDog: hasDog ?? this.hasDog,
      recalledSentence: recalledSentence ?? this.recalledSentence,
    );
  }
}
