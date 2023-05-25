import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/models/contact_model.dart';

class ContactServiceImpl extends ContactService with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ContactModel> _contacts = [];
  delay([int duration = 2]) async {
    await Future.delayed(Duration(seconds: duration));
  }

  @override
  Future createContact(CreateContactDto dto) async {
    delay();
    _contacts.add(
      ContactModel(
          id: '2',
          name: dto.name,
          email: dto.email,
          phone: dto.phone,
          address: dto.address),
    );
    refreshState();
  }

  @override
  Future deleteContact(String id) async {
    delay();
    _contacts.removeWhere((element) => element.id == id);
    refreshState();
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

  refreshState() {
    notifyListeners();
  }
}
