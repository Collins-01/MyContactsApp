import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/views/view_states/base_viewmodel.dart';
import 'package:my_contacts/ui/views/view_states/view_model_state.dart';
import 'package:my_contacts/ui/widgets/app_flushbar.dart';
import 'package:my_contacts/utils/utils.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator();
  final _log = appLogger(SignUpViewModel);
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signUp(String email, String password) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      changeState(const ViewModelState.busy());
      await _authRepository.signUp(email, password);
      changeState(const ViewModelState.idle());
      _navigationService.navigateToReplace(NavigationRoutes.EMAIL_VERIFICATION);
    } on Failure catch (e) {
      changeState(const ViewModelState.idle());
      changeState(ViewModelState.error(e));
      AppFlushBar.showError(title: e.title, message: e.message);

      _log.e("Error Logging In : ${e.message}");
    } catch (e) {
      _log.e(e.toString());
    }
  }
}
