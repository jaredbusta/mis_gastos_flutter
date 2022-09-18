// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TotalesDasboard {
  double totalIngresoAnual;
  double totalIngresosMes;
  double totalGastos;
  double totalCargas;

  TotalesDasboard({
    required this.totalIngresoAnual,
    required this.totalIngresosMes,
    required this.totalGastos,
    required this.totalCargas,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalIngresoAnual': totalIngresoAnual,
      'totalIngresosMes': totalIngresosMes,
      'totalGastos': totalGastos,
      'totalCargas': totalCargas,
    };
  }

  factory TotalesDasboard.fromMap(Map<String, dynamic> map) {
    return TotalesDasboard(
      totalIngresoAnual: map['totalIngresoAnual'] as double,
      totalIngresosMes: map['totalIngresosMes'] as double,
      totalGastos: map['totalGastos'] as double,
      totalCargas: map['totalCargas'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalesDasboard.fromJson(String source) =>
      TotalesDasboard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TotalesDasboard(totalIngresoAnual: $totalIngresoAnual, totalIngresosMes: $totalIngresosMes, totalGastos: $totalGastos, totalCargas: $totalCargas)';
  }
}
