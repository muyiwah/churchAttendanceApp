import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnalyticsModel {
  final double abscent;
  final double resolved;
  final double unresloved;
  final double present;
  final double totalMembers;
  final double newCommers;
  final double workers;
  final double nonWorkers;
  final double teenagers;
  final double men;
  final double women;
  dynamic date;
  final double children;
  AnalyticsModel({
    required this.abscent,
    required this.resolved,
    required this.unresloved,
    required this.present,
    required this.totalMembers,
    required this.newCommers,
    required this.workers,
    required this.nonWorkers,
    required this.teenagers,
    required this.men,
    required this.women,
    required this.date,
    required this.children,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abscent': abscent,
      'resolved': resolved,
      'unresloved': unresloved,
      'present': present,
      'totalMembers': totalMembers,
      'newCommers': newCommers,
      'workers': workers,
      'nonWorkers': nonWorkers,
      'teenagers': teenagers,
      'men': men,
      'women': women,
      'date': date,
      'children': children,
    };
  }

  factory AnalyticsModel.fromMap(Map<String, dynamic> map) {
    return AnalyticsModel(
      abscent: map['abscent'] as double,
      resolved: map['resolved'] as double,
      unresloved: map['unresloved'] as double,
      present: map['present'] as double,
      totalMembers: map['totalMembers'] as double,
      newCommers: map['newCommers'] as double,
      workers: map['workers'] as double,
      nonWorkers: map['nonWorkers'] as double,
      teenagers: map['teenagers'] as double,
      men: map['men'] as double,
      women: map['women'] as double,
      date: map['date'] as String,
      children: map['children'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalyticsModel.fromJson(String source) =>
      AnalyticsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnalyticsModel2 {
  final double abscent;
  final double resolved;

  AnalyticsModel2({
    required this.abscent,
    required this.resolved,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abscent': abscent,
      'resolved': resolved,
    };
  }

  factory AnalyticsModel2.fromMap(Map<String, dynamic> map) {
    return AnalyticsModel2(
      abscent: map['abscent'] as double,
      resolved: map['resolved'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalyticsModel2.fromJson(String source) => AnalyticsModel2.fromMap(json.decode(source) as Map<String, dynamic>);
}
