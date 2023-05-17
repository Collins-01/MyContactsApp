import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/views/view_states/view_states.dart';
import 'package:my_contacts/utils/utils.dart';

class AddContactViewModel extends BaseViewModel {
  final _log = appLogger(AddContactViewModel);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = NavigationService.instance;

  final ContactRepository _contactRepository = locator();

  createContact(String name, String phone, String email, String address) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      changeState(const ViewModelState.busy());
      await _contactRepository.createContact(CreateContactDto(
          address: address, email: email, name: name, phone: phone));
      changeState(const ViewModelState.idle());
      await _navigationService.goBack();
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
      _log.i("Error Logging In : ${e.message}");
    } catch (e) {
      _log.e(e.toString());
      changeState(
        ViewModelState.error(
          UserDefinedExceptions("Unknown", e.toString()),
        ),
      );
    }
  }
}
