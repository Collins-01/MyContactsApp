import 'package:my_contacts/core/data/remote/contacts/dtos/dtos.dart';
import 'package:my_contacts/core/models/contact_model.dart';

abstract class ContactInterface {
  Future<void> createContact(CreateContactDto dto);
  Future<void> deleteContact(String id);
  Future<void> getContacts();
  List<ContactModel> get contacts;
}

abstract class ContactService extends ContactInterface {}

abstract class ContactRepository extends ContactInterface {}
