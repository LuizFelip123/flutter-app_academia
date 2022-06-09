import 'package:gym_app/shared/models/user_abstract.dart';
import 'package:gym_app/shared/models/user_trainer.dart';

class UserAdm extends UserAbstract {
  late String gymName;
  late String logoGym;
  late List<int> listTrainerIds;
  late List<UserTrainer> listUserTrainers;
}
