import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/navigations/navigation_service.dart';

import '../../../../utils/utils.dart';
import '../../view_states/view_states.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator();
  final _log = appLogger(NetworkClient);
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login(String email, String password) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      changeState(const ViewModelState.busy());
      await _authRepository.login(email, password);
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
      _log.i("Error Logging In : ${e.message}");
    } catch (e) {
      _log.e(e.toString());
    }
  }
}
