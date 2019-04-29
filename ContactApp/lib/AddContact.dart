import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';



// Reference: https://flutter.dev/docs/cookbook/forms/retrieve-input
class AddContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: AddContactForm(),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();

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
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
                onSaved: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Record"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Contact.contacts.add(Contact(id: Contact.contacts.last.id + 1, name: name, phoneNumber: phoneNumber));
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