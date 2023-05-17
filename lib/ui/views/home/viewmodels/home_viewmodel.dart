import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/models/contact_model.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/ui/views/view_states/view_states.dart';

final ContactRepository _contactRepository = locator();

class HomeViewModel extends BaseViewModel {
  final List<ContactModel> _contacts = _contactRepository.contacts;
  List<ContactModel> get contacts => _contacts;

  getContacts() async {
    try {
      changeState(const ViewModelState.busy());
      await _contactRepository.getContacts();
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
    } catch (e) {
      changeState(
        ViewModelState.error(
          UserDefinedExceptions(
            "Unknown Error",
            e.toString(),
          ),
        ),
      );
    }
  }
}
