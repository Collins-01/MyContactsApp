import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/data/remote/auth/login_response_payload.dart';
import 'package:my_contacts/core/models/user_model.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/utils/utils.dart';

class AuthServiceImpl extends AuthService {
  final _log = appLogger(AuthServiceImpl);

  String loginMutation = '''

    mutation Login (\$email: String!, \$password: String!)) {
      login(email: \$email , password: \$password) { 
        status
        credentials {
            token
        }
        errors {
            fullMessage
            message
            property
        }
        user {
            createdAt
            email
            id
            status
            tokens
            updatedAt
        }
      }
    }

   ''';

  String signupMutation = '''

    mutation SignUp (\$email: String!, \$password: String!, \$passwordConfirmation: String!) {
    signup(userInput: {email: \$email, password: \$password, passwordConfirmation: \$passwordConfirmation}) {
        status
        errors {
            fullMessage
            message
            property
        }
        user {
            createdAt
            email
            id
            status
            tokens
            updatedAt
        }
    }
}

         ''';

  final NetworkClient _networkClient = NetworkClient();
  UserModel? _userModel;
  @override
  Future<LoginResponsePayload> login(String email, String password) async {
    // var response = await _networkClient.runMutation(loginMutation, variables: {
    //   "email": email,
    //   "password": password,
    // });
    // _log.i(response);
    await Future.delayed(const Duration(seconds: 2));
    const fakeJson = {
      'email': 'email@example.com',
      'id': '123',
    };
    final kUser = UserModel.fromJson(fakeJson);
    _userModel = kUser;
    return LoginResponsePayload(token: 'ghgggccgghchchcgfcf', user: kUser);
  }

  @override
  Future<void> signUp(String email, String password) async {
    var result = await _networkClient.runMutation(signupMutation, variables: {
      'email': email,
      'password': password,
      'passwordConfirmation': password
    });
    _log.i(result);
  }

  @override
  UserModel? get currentUser => _userModel;
}
