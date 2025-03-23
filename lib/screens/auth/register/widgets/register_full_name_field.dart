import 'package:chatapp/extensions/context_extensions.dart';
import 'package:chatapp/shared/app_text_field/simple_text_field.dart';
import 'package:flutter/material.dart';

class RegisterFullNameField extends StatelessWidget {
  const RegisterFullNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SimpleTextField(
            labelValue: 'First name',
            hintTextValue: 'Your first name',
            controller: context.registerFormData.firstNameController,
          ),
        ),
        const SizedBox(width: 12,),
        Expanded(
          child: SimpleTextField(
            labelValue: 'Last nanme',
            hintTextValue: 'Your last name',
            controller: context.registerFormData.lastNameController,
          ),
        ),
      ],
    );
  }
}
