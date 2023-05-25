import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/data/remote/auth/login_response_payload.dart';
import 'package:my_contacts/core/models/user_model.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/graphql/authentication/login/login.graphql.dart';
import 'package:my_contacts/utils/utils.dart';

class AuthServiceImpl extends AuthService {
  final _log = appLogger(AuthServiceImpl);
  final NetworkClient _networkClient = NetworkClient();
  UserModel? _userModel;
  @override
  Future<LoginResponsePayload> login(String email, String password) async {
    // var i = await _networkClient.qlClient.mutate(MutationOptions(document: document))
    // var r = await _networkClient.mutate<Mutation$Login, dynamic>(
    //   Options$Mutation$Login()
    //     transform: (e)=>_tranform(e),);
    // _log.i("Response from Login: $r");

    const fakeJson = {
      'email': 'email@example.com',
      'id': '123',
    };
    final kUser = UserModel.fromJson(fakeJson);
    _userModel = kUser;
    return LoginResponsePayload(token: 'ghgggccgghchchcgfcf', user: kUser);
  }

  _tranform(Mutation$Login e) {
    _log.i("Transform Info ::  ${e.login}");
  }

  @override
  Future<void> signUp(String email, String password) async {}

  @override
  UserModel? get currentUser => _userModel;
}
