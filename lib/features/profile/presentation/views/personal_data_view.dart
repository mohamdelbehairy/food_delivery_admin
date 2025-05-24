import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/model/user_data_model.dart';
import '../personal_data/personal_data_bloc.dart';
import 'widgets/personal_data_view_body.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDataBloc()..initTextFields(userData),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context, title: "Personal Data"),
        body: PersonalDataViewBody(userData: userData),
      ),
    );
  }
}
