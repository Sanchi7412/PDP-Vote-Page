import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoresRecord extends FirestoreRecord {
  ScoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "total_score" field.
  double? _totalScore;
  double get totalScore => _totalScore ?? 0.0;
  bool hasTotalScore() => _totalScore != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "score_1" field.
  double? _score1;
  double get score1 => _score1 ?? 0.0;
  bool hasScore1() => _score1 != null;

  // "score_2" field.
  double? _score2;
  double get score2 => _score2 ?? 0.0;
  bool hasScore2() => _score2 != null;

  // "score_3" field.
  double? _score3;
  double get score3 => _score3 ?? 0.0;
  bool hasScore3() => _score3 != null;

  // "score_4" field.
  double? _score4;
  double get score4 => _score4 ?? 0.0;
  bool hasScore4() => _score4 != null;

  // "score_5" field.
  double? _score5;
  double get score5 => _score5 ?? 0.0;
  bool hasScore5() => _score5 != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "isShowName" field.
  bool? _isShowName;
  bool get isShowName => _isShowName ?? false;
  bool hasIsShowName() => _isShowName != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _teamName = snapshotData['team_name'] as String?;
    _totalScore = castToType<double>(snapshotData['total_score']);
    _comment = snapshotData['comment'] as String?;
    _score1 = castToType<double>(snapshotData['score_1']);
    _score2 = castToType<double>(snapshotData['score_2']);
    _score3 = castToType<double>(snapshotData['score_3']);
    _score4 = castToType<double>(snapshotData['score_4']);
    _score5 = castToType<double>(snapshotData['score_5']);
    _userName = snapshotData['user_name'] as String?;
    _isShowName = snapshotData['isShowName'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scores');

  static Stream<ScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScoresRecord.fromSnapshot(s));

  static Future<ScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScoresRecord.fromSnapshot(s));

  static ScoresRecord fromSnapshot(DocumentSnapshot snapshot) => ScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScoresRecordData({
  String? displayName,
  String? teamName,
  double? totalScore,
  String? comment,
  double? score1,
  double? score2,
  double? score3,
  double? score4,
  double? score5,
  String? userName,
  bool? isShowName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'team_name': teamName,
      'total_score': totalScore,
      'comment': comment,
      'score_1': score1,
      'score_2': score2,
      'score_3': score3,
      'score_4': score4,
      'score_5': score5,
      'user_name': userName,
      'isShowName': isShowName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScoresRecordDocumentEquality implements Equality<ScoresRecord> {
  const ScoresRecordDocumentEquality();

  @override
  bool equals(ScoresRecord? e1, ScoresRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.teamName == e2?.teamName &&
        e1?.totalScore == e2?.totalScore &&
        e1?.comment == e2?.comment &&
        e1?.score1 == e2?.score1 &&
        e1?.score2 == e2?.score2 &&
        e1?.score3 == e2?.score3 &&
        e1?.score4 == e2?.score4 &&
        e1?.score5 == e2?.score5 &&
        e1?.userName == e2?.userName &&
        e1?.isShowName == e2?.isShowName;
  }

  @override
  int hash(ScoresRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.teamName,
        e?.totalScore,
        e?.comment,
        e?.score1,
        e?.score2,
        e?.score3,
        e?.score4,
        e?.score5,
        e?.userName,
        e?.isShowName
      ]);

  @override
  bool isValidKey(Object? o) => o is ScoresRecord;
}
