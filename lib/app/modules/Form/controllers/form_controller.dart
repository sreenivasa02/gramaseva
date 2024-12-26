import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var formFields = [].obs;
  var formData = {}.obs;

  @override
  void onInit() {
    super.onInit();

    fetchFormDetails();
  }

  void fetchFormDetails() async {

    formFields.value = [
      {'type': 'text', 'label': 'Adhar Number', 'required': true, 'keyboardType': TextInputType.number},
      {'type': 'text', 'label': 'Application Number', 'required': true, 'keyboardType': TextInputType.number},
      {'type': 'text', 'label': 'Mobile Number', 'required': true, 'keyboardType': TextInputType.phone},
      {'type': 'email', 'label': 'Email', 'required': true},
      {'type': 'text', 'label': 'Residential Address', 'required': true},
      {'type': 'text', 'label': 'Age', 'required': false, 'keyboardType': TextInputType.number},
      {'type': 'radio', 'label': 'Gender', 'required': true, 'options': ['Male', 'Female', 'Other']},
      {'type': 'checkbox', 'label': 'Select Pension Category', 'required': false, 'options': ['Option 1', 'Option 2', 'Option 3']},
    ];
  }


  void updateField(String label, dynamic value) {
    formData[label] = value;
  }
  String? validateForm() {
    for (var field in formFields) {
      String label = field['label'];
      bool required = field['required'] ?? false;
      String? value = formData[label];


      if (required && (value == null || value.trim().isEmpty)) {
        return 'The $label field is required.';
      }


      if (field['type'] == 'email' && value != null) {
        RegExp gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
        if (!gmailRegex.hasMatch(value)) {
          return 'Please enter a valid Gmail address.';
        }
      }


      if (field['label'] == 'Mobile Number' && value != null) {
        RegExp mobileRegex = RegExp(r'^[0-9]{10}$');
        if (!mobileRegex.hasMatch(value)) {
          return 'Please enter a valid 10-digit mobile number.';
        }
      }


      if (field['label'] == 'Age' && value != null) {
        int? age = int.tryParse(value);
        if (age == null || age < 18) {
          return 'Age must be a valid number and above 18.';
        }
      }


      if (field['label'] == 'Adhar Number' && value != null) {
        RegExp aadharRegex = RegExp(r'^\d{12}$');
        if (!aadharRegex.hasMatch(value)) {
          return 'Please enter a valid 12-digit Aadhar number.';
        }
      }
    }
    return null;
  }




}

