import 'package:my_contacts/core/data/remote/contacts/dtos/dtos.dart';
import 'package:my_contacts/core/models/contact_model.dart';

abstract class ContactInterface {
  Future createContact(CreateContactDto dto);
  Future deleteContact(String id);
  Future<List<ContactModel>> getContacts();
}

abstract class ContactService extends ContactInterface {}

abstract class ContactRepository extends ContactInterface {}
