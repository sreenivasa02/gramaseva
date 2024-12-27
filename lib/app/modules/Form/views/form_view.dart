import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../Home/views/home_view.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  final FormController formController= Get.put(FormController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Welfare Scheme'),centerTitle: true,backgroundColor:Colors.lightBlueAccent.withOpacity(0.2), ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
                SizedBox(height: 100,width: 100,child:  Base64ImageWidget(base64String:formController.image.value),),
              Text(formController.serviceName.value),
              Expanded(
                child: ListView(
                  children: formController.formFields.map((field) {
                    if (field['type'] == 'text') {
                      return TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(field['digitLength']),

                        ],
                        decoration: InputDecoration(labelText: field['label']),
                        onChanged: (value) {
                          formController.updateField(field['label'], value);
                        },
                        keyboardType: field['keyboardType'],
                      );
                    }
                    if (field['type'] == 'email') {
                      return TextField(
                        decoration: InputDecoration(labelText: field['label']),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          controller.updateField(field['label'], value);
                        },
                      );
                    }
                    if (field['type'] == 'date') {
                      return TextButton(
                        onPressed: () async {
                          DateTime? pickedDate = await _selectDate(context);
                          if (pickedDate != null) {
                            formController.updateField(field['label'], pickedDate.toString());
                          }
                        },
                        child: Text(field['label']),
                      );
                    }
                    if (field['type'] == 'radio') {
                      return Column(
                        children: (field['options'] as List<String>).map((option) {
                          return RadioListTile<String>(
                            title: Text(option),
                            value: option,
                            groupValue: formController.formData[field['label']],
                            onChanged: (value) {
                              formController.updateField(field['label'], value);
                            },
                          );
                        }).toList(),
                      );
                    }
                    if (field['type'] == 'checkbox') {
                      return DropdownButton<String>(
                        hint: Text(field['label']),
                        value: formController.formData[field['label']],
                        onChanged: (value) {
                          formController.updateField(field['label'], value);
                        },
                        items: (field['options'] as List<String>).map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      );
                    }
                    return const SizedBox.shrink();
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String? validationMessage = formController.validateForm();
                  if (validationMessage == null) {
                   formController.clearForm();

                    Get.snackbar(
                      'Success',
                      'Form submitted successfully! Application Number: ${controller.applicationNumber.value}',
                      colorText: Colors.white,
                      backgroundColor: Colors.green,
                    );
                   Get.toNamed('/home');
                  } else {

                    Get.snackbar('Error', validationMessage, colorText: Colors.red, backgroundColor: Colors.white);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      }),
    );
  }



  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    return selectedDate;
  }
}
