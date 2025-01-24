import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'team_tile_model.dart';
export 'team_tile_model.dart';

class TeamTileWidget extends StatefulWidget {
  const TeamTileWidget({
    super.key,
    required this.portfolioName,
    required this.teamName,
    required this.turnNum,
  });

  final String? portfolioName;
  final String? teamName;
  final int? turnNum;

  @override
  State<TeamTileWidget> createState() => _TeamTileWidgetState();
}

class _TeamTileWidgetState extends State<TeamTileWidget> {
  late TeamTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              label: '評価する',
              backgroundColor: FlutterFlowTheme.of(context).primary,
              icon: FontAwesomeIcons.edit,
              onPressed: (_) async {
                context.pushNamed(
                  'vote',
                  queryParameters: {
                    'teamName': serializeParam(
                      widget.teamName,
                      ParamType.String,
                    ),
                    'portfolioName': serializeParam(
                      widget.portfolioName,
                      ParamType.String,
                    ),
                    'turn': serializeParam(
                      widget.turnNum,
                      ParamType.int,
                    ),
                    'userName': serializeParam(
                      currentUserUid,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
            ),
            SlidableAction(
              label: '総合成績',
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              icon: FontAwesomeIcons.clipboardCheck,
              onPressed: (_) async {
                _model.scoreDatas = await queryScoresRecordOnce(
                  queryBuilder: (scoresRecord) => scoresRecord.where(
                    'team_name',
                    isEqualTo: widget.teamName,
                  ),
                );

                context.pushNamed(
                  'result',
                  queryParameters: {
                    'teamName': serializeParam(
                      widget.teamName,
                      ParamType.String,
                    ),
                    'scores': serializeParam(
                      functions.averageScores(
                          widget.teamName, _model.scoreDatas?.toList()),
                      ParamType.double,
                      isList: true,
                    ),
                  }.withoutNulls,
                );

                safeSetState(() {});
              },
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            title: Text(
              '${widget.turnNum?.toString()}. ${valueOrDefault<String>(
                widget.portfolioName,
                'ポートフォリオ名',
              )}',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Noto Sans JP',
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                  ),
            ),
            subtitle: Text(
              widget.teamName!,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Noto Sans JP',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                  ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
            dense: false,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
      ),
    );
  }
}
