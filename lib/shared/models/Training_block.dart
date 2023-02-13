import 'package:primeiro_app/shared/models/daily_training.dart';

class TrainingBlock{
  String id;
  String name;
  String obs;
  List<DailyTraining> listDailyTraining;
  DateTime start;
  TrainingBlock({ required this.start, required this.id, required this.name, required this.obs, required this.listDailyTraining});
}