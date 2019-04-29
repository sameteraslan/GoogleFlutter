class Contact {
  int id;
  String name;
  String phoneNumber;


  Contact({this.id, this.name, this.phoneNumber});
  //Contact(this.name, this.phoneNumber);

  static List<Contact> contacts = [
  Contact(id: 0, name: "Ahmet", phoneNumber: "0555 555 55 55"),
  Contact(id: 1, name: "Ayse", phoneNumber: "0555 555 55 55"),
  Contact(id: 2, name: "Kemal", phoneNumber: "0555 555 55 55"),
  Contact(id: 3, name: "Emre", phoneNumber: "0555 555 55 55"),
  Contact(id: 4, name: "Alp", phoneNumber: "0555 555 55 55"),
  Contact(id: 5, name: "Fatih", phoneNumber: "0555 555 55 55"),
  Contact(id: 6, name: "Kadir", phoneNumber: "0555 555 55 55"),
  Contact(id: 7, name: "Kübra", phoneNumber: "0555 555 55 55"),
  Contact(id: 8, name: "Mehmet", phoneNumber: "0555 555 55 55"),
  Contact(id: 9, name: "Akif", phoneNumber: "0555 555 55 55"),
  Contact(id: 10, name: "Said", phoneNumber: "0555 555 55 55"),
  Contact(id: 11, name: "Yasin", phoneNumber: "0555 555 55 55"),
  Contact(id: 12, name: "Zeynep", phoneNumber: "0555 555 55 55"),
  ];
}

