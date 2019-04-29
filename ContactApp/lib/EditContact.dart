import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';



// Reference: https://flutter.dev/docs/cookbook/forms/retrieve-input
class EditContact extends StatelessWidget {
  String name, phone;
  int index;
  EditContact(this.name, this.phone, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Contact"),
      ),
      body: EditContactForm(name, phone, index),
    );
  }
}

class EditContactForm extends StatefulWidget {
  String name, phone;
  int index;
  EditContactForm(this.name, this.phone, this.index);
  @override
  _EditContactFormState createState() => _EditContactFormState(name, phone, index);
}

class _EditContactFormState extends State<EditContactForm> {
  final _formKey = GlobalKey<FormState>();

  String Mname, Mphone;
  int index;
  _EditContactFormState(this.Mname, this.Mphone, this.index);
  @override
  Widget build(BuildContext context) {
    String name;
    String phoneNumber;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),

              child: TextFormField(
                decoration: InputDecoration(labelText: "Contact Name"),
                initialValue: Mname,
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
                initialValue: Mphone,
                onSaved: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Update"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Contact.contacts[index].name = name;
                  Contact.contacts[index].phoneNumber = phoneNumber;
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}