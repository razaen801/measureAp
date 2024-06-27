import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measure_ap/common/widgets/global_text_widget.dart';
import 'package:measure_ap/constants/assets_paths.dart';
import 'package:measure_ap/modules/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:measure_ap/modules/questionnaire/widgets/animal_item.dart';
import 'package:measure_ap/modules/questionnaire/widgets/menu_item.dart';

class AnimalIdentificationQuestions extends StatelessWidget {
  const AnimalIdentificationQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GlobalTextWidget.hugeTitle("Identify the animals"),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
          child: const GlobalTextWidget.content(
            textAlign: TextAlign.center,
            "Please show the patient the following animals and check their reaction.",
            maxLines: 2,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) =>
          previous.assessmentData?.hasIdentifiedChicken != current.assessmentData?.hasIdentifiedChicken,
          builder: (context, state) {
            return AnimalItem(
              title: "Chicken",
              isSelected: state.assessmentData?.hasIdentifiedChicken ?? false,
              image: chickenImage,
              onChanged: (value){
                context.read<QuestionnaireBloc>().add( IdentifiesAnimals(identifiesChicken: value));
              },
            );
          },
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) =>
          previous.assessmentData?.hasIdentifiedHorse != current.assessmentData?.hasIdentifiedHorse,
          builder: (context, state) {
            return AnimalItem(
              title: "Horse",
              isSelected: state.assessmentData?.hasIdentifiedHorse ?? false,
              image: horseImage,
              onChanged: (value){
                context.read<QuestionnaireBloc>().add( IdentifiesAnimals(identifiesHorse: value));
              },
            );
          },
        ),
        BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          buildWhen: (previous, current) =>
          previous.assessmentData?.hasIdentifiedDog != current.assessmentData?.hasIdentifiedDog,
          builder: (context, state) {
            return AnimalItem(
              title: "Dog",
              isSelected: state.assessmentData?.hasIdentifiedDog ?? false,
              image: dogImage,
              onChanged: (value){
                context.read<QuestionnaireBloc>().add( IdentifiesAnimals(identifiesDog: value));
              },
            );
          },
        ),
      ],
    );
  }
}



