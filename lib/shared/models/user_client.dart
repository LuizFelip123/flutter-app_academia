import 'package:primeiro_app/shared/models/user_abstract.dart';
import 'package:primeiro_app/shared/models/Training_block.dart';

class UserClient  extends AbstractUser{
  List<TrainingBlock> listTrainingBlock;
  UserClient({required this.listTrainingBlock});
 
}