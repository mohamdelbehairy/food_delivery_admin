import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_arrow_back.dart';
import '../../manager/register/register_bloc.dart';
import 'register_bloc_listener.dart';
import 'register_header.dart';
import 'register_text_field_and_button_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        registerBlocListener(state, context);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomArrowBack(),
            RegisterHeader(),
            SizedBox(height: 24),
            RegisterTextFieldAndButtonSection(),
          ],
        ),
      ),
    );
  }
}
