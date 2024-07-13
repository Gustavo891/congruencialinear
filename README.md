# FMC1

## Código Principal:
```dart
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/flutter_flow/custom_functions.dart';

String? congruencia(
  int? a,
  int? b,
  int? m,
) {

  List<int> euclides(int a, int b) {
    if (a == 0) {
      return [b, 0, 1];
    } else {
      List<int> result = euclides(b % a, a);
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

    List<int> euclidResult = euclides(A, N);
    int d = euclidResult[0];
    int u = euclidResult[1];

    if (B % d != 0) {
      return [-1];
    }

    int x0 = (u * (B ~/ d)) % N;
    if (x0 < 0) x0 += N;

    List<int> resultados = [];
    for (int i = 0; i < d; i++) {
      resultados.add((x0 + i * (N ~/ d)) % N);
    }
    return resultados;
  }

  if (a == null || b == null || m == null) {
    return null;
  }

  List<int> resultados = linearCongruence(a, b, m);

  if (resultados.isNotEmpty && resultados[0] != -1) {
    return resultados
        .reduce((curr, next) => curr < next ? curr : next)
        .toString();
  } else {
    return "Não há solução";
  }

}
```
