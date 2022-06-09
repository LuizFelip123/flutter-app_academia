import 'package:gym_app/shared/models/user_abstract.dart';
import 'package:gym_app/shared/models/user_client.dart';

class UserTrainer extends UserAbstract {
  //lista ids dos clientes
  late List<int> clientIds;
  //lista de clientes
  late List<UserClient> listUserClient;
}
