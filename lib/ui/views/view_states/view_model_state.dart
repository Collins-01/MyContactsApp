import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_contacts/core/network_service/network_service.dart';

part 'view_model_state.freezed.dart';

@freezed
class ViewModelState with _$ViewModelState {
  const factory ViewModelState.idle() = _Idle;
  const factory ViewModelState.error(Failure failure) = _Error;
  const factory ViewModelState.busy() = _Busy;
}
