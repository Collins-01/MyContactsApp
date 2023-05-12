import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/network_service/network_service.dart';

class AuthServiceImpl extends AuthService {
  final NetworkClient _networkClient = NetworkClient.instance;
  @override
  Future<void> login(String email, String password) async {
//     String mutation = """
//   mutation Login(\$starrableId: ID!) {
//     login(input: {email: $email, password: $password}) {
//       starrable {
//         viewerHasStarred
//       }
//     }
//   }
// """;
    // var response = await _networkClient.runMutation(mutation);
    // return 'response';
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
