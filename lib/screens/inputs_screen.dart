import 'package:components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'name': '',
      'surname': '',
      'email': '',
      'password': '',
      'role': '',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  formProperty: 'name',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Surname',
                    hintText: 'Enter your surname',
                    formProperty: 'surname',
                    formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues),
                const SizedBox(height: 30),
                CustomInputField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Superuser'),
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer'),
                    ),
                    DropdownMenuItem(
                      value: 'Junior Developer',
                      child: Text('Junior Developer'),
                    )
                  ],
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Save'),
                    ),
                  ),
                  onPressed: () {
                    if (!myFormKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      print('Form is not valid');
                      return;
                    }
                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
