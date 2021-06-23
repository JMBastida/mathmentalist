import 'package:mathmentalist/src/core/app_constant.dart';
import 'package:mathmentalist/src/data/models/score_board.dart';

class GameCategory {
  int id;
  String name;
  String key;
  GameCategoryType gameCategoryType;
  String routePath;
  ScoreBoard scoreboard;

  GameCategory(this.id, this.name, this.key, this.gameCategoryType,
      this.routePath, this.scoreboard);
}
