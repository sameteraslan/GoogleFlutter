import 'package:flutter/material.dart';
import 'package:flutter_app/AddContact.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/EditContact.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts;

  @override
  void initState() {
    contacts = Contact.contacts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Sorting Reference: https://stackoverflow.com/questions/49675055/sort-list-by-alphabetical-order
    Contact.contacts.sort((a, b) => a.name[0].toLowerCase().compareTo(b.name[0].toLowerCase()));

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContact()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            Contact contact = contacts[index];
            return Dismissible(
              key: Key(contact.id.toString()),
              onDismissed: (direction) {
                Contact.contacts.removeAt(index);
                contacts.removeAt(index);
                //Snackbar Reference: https://flutter.dev/docs/cookbook/design/snackbars
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(contact.name + " deleted", textDirection: TextDirection.ltr)));
                setState(() {});
              },
              background: Container(color: Colors.red),
              child: GestureDetector(
                onDoubleTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditContact(contact.name, contact.phoneNumber, index)));
            }
            ,child: Container(padding: EdgeInsets.all(5),
              child: Column(children: <Widget>[
                  Row(children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage("http://icons.iconarchive.com/icons/graphicloads/100-flat/256/contact-icon.png")
                      ),
                      Padding(padding: EdgeInsets.only(left: 8),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[Text(contact.name), Text(contact.phoneNumber)]
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 8), child: Divider(height: 2))
                ],
              ),
            ),),);
          }),
    );
  }
}