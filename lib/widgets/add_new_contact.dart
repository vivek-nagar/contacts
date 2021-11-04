import 'package:contact_app_by_vivek/provider/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// own import
import 'package:contact_app_by_vivek/models/contactModal.dart';


class NewContactDialouge extends StatelessWidget {
  final BuildContext context;
  final bool isEdit;

  final UsersNewProvid addUsersBloc;
  final UserModel? userModel;

  NewContactDialouge(
      this.context, this.isEdit, this.addUsersBloc, this.userModel);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        isEdit ? 'Edit Contact' : 'Add new Contact',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField(isEdit ? userModel!.firstName : "First name",
                _firstNameController),
            getTextField(isEdit ? userModel!.lastName : "Last name",
                _lastNameController),
            getPhoneTextField(
                isEdit ? userModel!.mobileNo : "Phone No.", _mobileController),
            getEmailTextField(
                isEdit ? userModel!.email : "Email Id", _emailController),
            getAddressTextField(
                isEdit ? userModel!.address : "Address", _addressController),
            GestureDetector(
              onTap: () {
                _saveData();
                Navigator.of(context).pop();
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: getAppBorderButton(
                    isEdit ? "Edit" : "Add",
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        autofillHints: [
          AutofillHints.givenName,
        ],
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );
  }

  Widget getPhoneTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        autofillHints: [
          AutofillHints.telephoneNumber,
        ],
        keyboardType: TextInputType.phone,
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );
  }

  Widget getEmailTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        autofillHints: [
          AutofillHints.email,
        ],
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );
  }

  Widget getAddressTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        autofillHints: [
          AutofillHints.addressCityAndState,
        ],
        keyboardType: TextInputType.emailAddress,
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );
  }

  Widget getAppBorderButton(String buttonLabel) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  void _saveData() {
    if (isEdit == false) {
      addUsersBloc.insertUser.add(UserModel(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          mobileNo: _mobileController.text,
          email: _emailController.text,
          address: _addressController.text,
          time: nowTime()));
    } else {
      addUsersBloc.inUpdateUser.add(UserModel(
          id: userModel!.id,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          mobileNo: _mobileController.text,
          email: _emailController.text,
          address: _addressController.text,
          time: nowTime()));
    }
  }

  String nowTime() {
    final now = DateTime.now();
    String date = DateFormat("yyyy-MM-dd").format(now);
    String time = DateFormat("H:m:s").format(now);
    return date + " " + time;
  }
}
