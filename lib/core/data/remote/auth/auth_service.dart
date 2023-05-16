import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/network_service/network_service.dart';
import 'package:my_contacts/utils/utils.dart';

class AuthServiceImpl extends AuthService {
  final _log = appLogger(AuthServiceImpl);
  final NetworkClient _networkClient = NetworkClient.instance;
  @override
  Future<void> login(String email, String password) async {
    String login = '''
      mutation Login(\$email: String!, \$password: String!) {
          login(email: \$email, password: \$password) {
             credentials {
               token
               },
            errors {
            message,
            fullMessage,
            property
          },
          status,
          user {
            email,
            
          }
          }
          }

     ''';
    var response = await _networkClient.runMutation(
      login,
      variables: {"email": email, "password": password},
    );

    return response;
  }

  @override
  Future<void> signUp(String email, String password) async {
    String mutation = """
          mutation SignUp(input: {\$email: String!, \$password: String!, \$passwordConfirmation: String!}) {
          login(email: \$email, password: \$password) {
             credentials {
               token
               },
            errors {
            message,
            fullMessage,
            property
          },
          status,
          user {
            email
            
          }
          }
}

     """;
    var response = await _networkClient.runMutation(mutation);
    _log.i(response, functionName: "SignUP");
    return response;
  }
}
