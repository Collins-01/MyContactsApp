import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/models/contact_model.dart';

class ContactServiceImpl extends ContactService {
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
  Future<List<ContactModel>> getContacts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
