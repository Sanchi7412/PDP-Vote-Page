import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'team_card_model.dart';
export 'team_card_model.dart';

class TeamCardWidget extends StatefulWidget {
  const TeamCardWidget({
    super.key,
    required this.teamName,
    required this.portfolioName,
    required this.turnNum,
    this.docsUrls,
  });

  final String? teamName;
  final String? portfolioName;
  final int? turnNum;
  final String? docsUrls;

  @override
  State<TeamCardWidget> createState() => _TeamCardWidgetState();
}

class _TeamCardWidgetState extends State<TeamCardWidget>
    with TickerProviderStateMixin {
  late TeamCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 170.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x23000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${valueOrDefault<String>(
                        widget.turnNum?.toString(),
                        '0',
                      )}. ${widget.teamName}',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Noto Sans JP',
                                fontSize: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 24.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 32.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 32.0;
                                  } else {
                                    return 32.0;
                                  }
                                }(),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.portfolioName,
                        'NaN',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Noto Sans JP',
                                fontSize: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return 28.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return 36.0;
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return 36.0;
                                  } else {
                                    return 36.0;
                                  }
                                }(),
                                letterSpacing: 0.0,
                              ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
              SizedBox(
                height: 100.0,
                child: VerticalDivider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FFButtonWidget(
                    onPressed: true
                        ? null
                        : () async {
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
                                  currentUserDisplayName,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                    text: '評価ページ',
                    icon: const FaIcon(
                      FontAwesomeIcons.edit,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Noto Sans JP',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: (widget.docsUrls == '' ? true : false)
                        ? null
                        : () async {
                            await launchURL(widget.docsUrls!);
                          },
                    text: '開発Docs  ',
                    icon: const FaIcon(
                      FontAwesomeIcons.print,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Noto Sans JP',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
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
                    text: '総合スコア',
                    icon: const FaIcon(
                      FontAwesomeIcons.solidChartBar,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Noto Sans JP',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
