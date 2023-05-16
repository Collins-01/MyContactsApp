import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/widgets/app_flushbar.dart';

import '../../../../utils/utils.dart';
import '../../view_states/view_states.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator();
  final _log = appLogger(LoginViewModel);
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login(String email, String password) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      changeState(const ViewModelState.busy());

      _log.i("Testing Login");
      await _authRepository.login(email, password);
      changeState(const ViewModelState.idle());
      await _navigationService.navigateToReplace(NavigationRoutes.HOME);
    } on Failure catch (e) {
      changeState(const ViewModelState.idle());
      AppFlushBar.showError(title: e.title, message: e.message);

      changeState(ViewModelState.error(e));

      _log.i("Error Logging In : ${e.message}");
    } catch (e) {
      changeState(const ViewModelState.idle());
      _log.e(e.toString());
      AppFlushBar.showError(title: "Unhandled Error", message: e.toString());
    }
  }
}
