import 'package:primeiro_app/shared/models/user_abstract.dart';
import 'package:primeiro_app/shared/models/user_client.dart';

class UserTrainer extends AbstractUser{
  List<int>? clientIds;
  List<UserClient>? listClient;
}