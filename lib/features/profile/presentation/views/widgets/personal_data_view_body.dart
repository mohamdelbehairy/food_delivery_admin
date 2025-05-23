import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/widgets/buttons_list_view.dart';
import '../../../../../core/widgets/text_field_list_view.dart';
import '../../../data/model/user_data_model.dart';
import '../../personal_data/personal_data_bloc.dart';
import 'personal_data_image_widget.dart';

class PersonalDataViewBody extends StatelessWidget {
  const PersonalDataViewBody({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    final personalData = context.read<PersonalDataBloc>();
    return BlocConsumer<PersonalDataBloc, PersonalDataState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          Navigation.pop(context);
        }
        if (state is CancleChanges) {
          Helper.customSnackBar(context, message: "Changes cancelled");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: personalData.formKey,
            child: Column(
              children: [
                const SizedBox(height: 32),
                PersonalDataImageWidget(
                    userImage: userData.userImage,
                    imageFile: personalData.imageFile),
                const SizedBox(height: 32),
                TextFieldListView(list: personalData.textFieldItems()),
                const SizedBox(height: 32),
                ButtonsListView(buttons: personalData.buttonItems(userData)),
                const SizedBox(height: 32)
              ],
            ),
          ),
        );
      },
    );
  }
}
