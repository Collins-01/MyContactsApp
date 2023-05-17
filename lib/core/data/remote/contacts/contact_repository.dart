import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/models/contact_model.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactService _contactService;

  ContactRepositoryImpl({ContactService? contactService})
      : _contactService = contactService ?? locator();
  @override
  Future createContact(CreateContactDto dto) async {
    return await _contactService.createContact(dto);
  }

  @override
  Future deleteContact(String id) async {
    return await _contactService.deleteContact(id);
  }

  @override
  Future<void> getContacts() async {
    return await _contactService.getContacts();
  }

  @override
  List<ContactModel> get contacts => _contactService.contacts;
}
