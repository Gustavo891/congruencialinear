import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? congruencia(
  int? a,
  int? b,
  int? m,
) {
  List<int> extendedEuclid(int a, int b) {
    if (a == 0) {
      return [b, 0, 1];
    } else {
      List<int> result = extendedEuclid(b % a, a);
      int gcd = result[0];
      int x1 = result[1];
      int y1 = result[2];
      int x = y1 - (b ~/ a) * x1;
      int y = x1;
      return [gcd, x, y];
    }
  }

  List<int> linearCongruence(int A, int B, int N) {
    A = A % N;
    B = B % N;

    List<int> euclidResult = extendedEuclid(A, N);
    int d = euclidResult[0];
    int u = euclidResult[1];

    // No solution exists
    if (B % d != 0) {
      return [-1];
    }

    int x0 = (u * (B ~/ d)) % N;
    if (x0 < 0) x0 += N;

    List<int> solutions = [];
    for (int i = 0; i < d; i++) {
      solutions.add((x0 + i * (N ~/ d)) % N);
    }
    return solutions;
  }

  if (a == null || b == null || m == null) {
    return null;
  }

  List<int> solutions = linearCongruence(a, b, m);

  // Return the smallest solution if it exists
  if (solutions.isNotEmpty && solutions[0] != -1) {
    return solutions
        .reduce((curr, next) => curr < next ? curr : next)
        .toString();
  } else {
    return "Não há solução";
  }
}
