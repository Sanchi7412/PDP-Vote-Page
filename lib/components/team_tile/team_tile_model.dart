import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'team_tile_widget.dart' show TeamTileWidget;
import 'package:flutter/material.dart';

class TeamTileModel extends FlutterFlowModel<TeamTileWidget> {
  ///  Local state fields for this component.

  String portfolioName = 'ポートフォリオ名';

  String teamName = 'チーム名';

  int? turn = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ScoresRecord>? scoreDatas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
