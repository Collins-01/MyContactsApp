import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/models/contact_model.dart';

class ContactServiceImpl extends ContactService with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ContactModel> _contacts = [];
  @override
  Future createContact(CreateContactDto dto) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future deleteContact(String id) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future getContacts() async {
    await Future.delayed(const Duration(seconds: 2));
    _contacts.add(
      ContactModel(
        id: '1',
        name: "John Doe",
        email: "johndoe@gmail.com",
        phone: "+2348165458909",
        address: "No 35, Mikirom Hub, Texas, USA",
      ),
    );
    notifyListeners();
  }

  @override
  List<ContactModel> get contacts => _contacts;
}
