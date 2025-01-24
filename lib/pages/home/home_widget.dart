import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/team_card/team_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: AuthUserStreamWidget(
            builder: (context) => Text(
              currentUserDisplayName,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans JP',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Noto Sans JP',
                                          letterSpacing: 0.0,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                tabs: const [
                                  Tab(
                                    text: 'チーム一覧',
                                  ),
                                  Tab(
                                    text: '未評価',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  StreamBuilder<List<TeamScoresRecord>>(
                                    stream: queryTeamScoresRecord(
                                      queryBuilder: (teamScoresRecord) =>
                                          teamScoresRecord.orderBy('turn'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<TeamScoresRecord>
                                          columnTeamScoresRecordList =
                                          snapshot.data!;

                                      return SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnTeamScoresRecordList.length,
                                              (columnIndex) {
                                            final columnTeamScoresRecord =
                                                columnTeamScoresRecordList[
                                                    columnIndex];
                                            return TeamCardWidget(
                                              key: Key(
                                                  'Key95b_${columnIndex}_of_${columnTeamScoresRecordList.length}'),
                                              teamName: columnTeamScoresRecord
                                                  .teamName,
                                              portfolioName:
                                                  columnTeamScoresRecord
                                                      .portfolioName,
                                              turnNum:
                                                  columnTeamScoresRecord.turn,
                                              docsUrls: columnTeamScoresRecord
                                                  .docsUrl,
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<TeamScoresRecord>>(
                                      stream: queryTeamScoresRecord(
                                        queryBuilder: (teamScoresRecord) =>
                                            teamScoresRecord
                                                .whereNotIn(
                                                    'team_name',
                                                    (currentUserDocument
                                                            ?.assessedTeam
                                                            .toList() ??
                                                        []))
                                                .orderBy('turn'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<TeamScoresRecord>
                                            columnTeamScoresRecordList =
                                            snapshot.data!;

                                        return SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnTeamScoresRecordList
                                                    .length, (columnIndex) {
                                              final columnTeamScoresRecord =
                                                  columnTeamScoresRecordList[
                                                      columnIndex];
                                              return TeamCardWidget(
                                                key: Key(
                                                    'Keyf12_${columnIndex}_of_${columnTeamScoresRecordList.length}'),
                                                teamName: columnTeamScoresRecord
                                                    .teamName,
                                                portfolioName:
                                                    columnTeamScoresRecord
                                                        .portfolioName,
                                                turnNum:
                                                    columnTeamScoresRecord.turn,
                                                docsUrls: columnTeamScoresRecord
                                                    .docsUrl,
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                wrapWithModel(
                  model: _model.footerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const FooterWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
