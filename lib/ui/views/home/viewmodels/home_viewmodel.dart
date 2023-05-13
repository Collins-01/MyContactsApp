import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/ui/views/view_states/view_states.dart';

class HomeViewModel extends BaseViewModel {
  final ContactRepository _contactRepository = locator();

  getContacts() async {
    try {
      changeState(const ViewModelState.busy());
      var items = await _contactRepository.getContacts();
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
    } catch (e) {}
  }
}
