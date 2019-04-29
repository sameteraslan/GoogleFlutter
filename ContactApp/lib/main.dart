import 'package:flutter/material.dart';
import 'package:flutter_app/AddContact.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/ContactPage.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  final List<Contact> contacts = Contact.contacts;

  Widget build(BuildContext context) {
    return MaterialApp(
       home: ContactPage()
    );
  }
}