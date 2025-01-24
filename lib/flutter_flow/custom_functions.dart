import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? averageRating(
  double score1,
  double score2,
  double score3,
  double score4,
  double score5,
) {
  List<double> rates = [score1, score2, score3, score4, score5]
      .where((score) => score != null)
      .cast<double>()
      .toList();

  // average a list of rates from the review list
  if (rates == null || rates.isEmpty) {
    return null;
  }
  double sum = 0;
  for (final rate in rates) {
    sum += rate;
  }
  return (sum / rates.length) * 20.0;
}

List<double>? averageScores(
  String? teamName,
  List<ScoresRecord>? scoresData,
) {
  // Prepare a document named scoreData and a String named teamName as arguments.  When a document is received, the data matching the teamName is extracted. The average value of score_1 to score_5 and the average value of total_score are calculated and returned in the order [score_1_avg, score_2_avg, score_3_avg, score_4_avg, score_5_avg, total_score_avg]. in the following order
  if (teamName == null || scoresData == null || scoresData.isEmpty) {
    return null;
  }

  List<double> score1List = [];
  List<double> score2List = [];
  List<double> score3List = [];
  List<double> score4List = [];
  List<double> score5List = [];
  List<double> totalScoreList = [];

  for (var scoreData in scoresData) {
    if (scoreData.teamName == teamName) {
      score1List.add(scoreData.score1);
      score2List.add(scoreData.score2);
      score3List.add(scoreData.score3);
      score4List.add(scoreData.score4);
      score5List.add(scoreData.score5);
      totalScoreList.add(scoreData.totalScore);
    }
  }

  double score1Avg = score1List.isNotEmpty
      ? score1List.reduce((a, b) => a + b) / score1List.length
      : 0.0;
  double score2Avg = score2List.isNotEmpty
      ? score2List.reduce((a, b) => a + b) / score2List.length
      : 0.0;
  double score3Avg = score3List.isNotEmpty
      ? score3List.reduce((a, b) => a + b) / score3List.length
      : 0.0;
  double score4Avg = score4List.isNotEmpty
      ? score4List.reduce((a, b) => a + b) / score4List.length
      : 0.0;
  double score5Avg = score5List.isNotEmpty
      ? score5List.reduce((a, b) => a + b) / score5List.length
      : 0.0;
  double totalScoreAvg = totalScoreList.isNotEmpty
      ? totalScoreList.reduce((a, b) => a + b) / totalScoreList.length
      : 0.0;

  return [score1Avg, score2Avg, score3Avg, score4Avg, score5Avg, totalScoreAvg];
}
