import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamScoresRecord extends FirestoreRecord {
  TeamScoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "turn" field.
  int? _turn;
  int get turn => _turn ?? 0;
  bool hasTurn() => _turn != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "portfolio_name" field.
  String? _portfolioName;
  String get portfolioName => _portfolioName ?? '';
  bool hasPortfolioName() => _portfolioName != null;

  // "docs_url" field.
  String? _docsUrl;
  String get docsUrl => _docsUrl ?? '';
  bool hasDocsUrl() => _docsUrl != null;

  void _initializeFields() {
    _turn = castToType<int>(snapshotData['turn']);
    _teamName = snapshotData['team_name'] as String?;
    _portfolioName = snapshotData['portfolio_name'] as String?;
    _docsUrl = snapshotData['docs_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teamScores');

  static Stream<TeamScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamScoresRecord.fromSnapshot(s));

  static Future<TeamScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamScoresRecord.fromSnapshot(s));

  static TeamScoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeamScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamScoresRecordData({
  int? turn,
  String? teamName,
  String? portfolioName,
  String? docsUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'turn': turn,
      'team_name': teamName,
      'portfolio_name': portfolioName,
      'docs_url': docsUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamScoresRecordDocumentEquality implements Equality<TeamScoresRecord> {
  const TeamScoresRecordDocumentEquality();

  @override
  bool equals(TeamScoresRecord? e1, TeamScoresRecord? e2) {
    return e1?.turn == e2?.turn &&
        e1?.teamName == e2?.teamName &&
        e1?.portfolioName == e2?.portfolioName &&
        e1?.docsUrl == e2?.docsUrl;
  }

  @override
  int hash(TeamScoresRecord? e) => const ListEquality()
      .hash([e?.turn, e?.teamName, e?.portfolioName, e?.docsUrl]);

  @override
  bool isValidKey(Object? o) => o is TeamScoresRecord;
}
