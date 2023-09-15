import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Member {
  final String name;
  final String uid;
  final String phoneNo;
  final String whatsappNo;
  final String address;
  final String neaerestBustop;
  final String group;
  final String nextOfKin;
  final String localGovtArea;
  final String email;
  final String unit;
  final String community;
  String date;
  String time;
  String reasonAbsent;
  bool isLogged;
  bool dontAskMeAgain;
  bool isUnitLeader;
  final String isWorker;
  String resolution;
  final String dateOfBirth;
  final String annivassary;
  final String communityUnitLeading;

  Member({
    required this.name,
    this.uid ="id",
    required this.phoneNo,
    required this.whatsappNo,
    required this.address,
    required this.neaerestBustop,
    required this.group,
    required this.nextOfKin,
    required this.localGovtArea,
    required this.email,
    required this.unit,
    this.community = '',
    this.date = '',
    this.time = '',
    this.reasonAbsent = '',
    required this.isLogged,
    this.dontAskMeAgain=false,
    this.isUnitLeader = false,
    required this.isWorker,
    this.resolution='unResolved',
    required this.dateOfBirth,
    required this.annivassary,
    this.communityUnitLeading = '',
  });

  Member copyWith({
    String? name,
    String? uid,
    String? phoneNo,
    String? whatsappNo,
    String? address,
    String? neaerestBustop,
    String? group,
    String? nextOfKin,
    String? localGovtArea,
    String? email,
    String? unit,
    String? community,
    String? date,
    String? time,
    String? reasonAbsent,
    bool? isLogged,
    bool? dontAskMeAgain,
    bool? isUnitLeader,
    String? isWorker,
    String? resolution,
    String? dateOfBirth,
    String? annivassary,
    String? communityUnitLeading,
  }) {
    return Member(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      phoneNo: phoneNo ?? this.phoneNo,
      whatsappNo: whatsappNo ?? this.whatsappNo,
      address: address ?? this.address,
      neaerestBustop: neaerestBustop ?? this.neaerestBustop,
      group: group ?? this.group,
      nextOfKin: nextOfKin ?? this.nextOfKin,
      localGovtArea: localGovtArea ?? this.localGovtArea,
      email: email ?? this.email,
      unit: unit ?? this.unit,
      community: community ?? this.community,
      date: date ?? this.date,
      time: time ?? this.time,
      reasonAbsent: reasonAbsent ?? this.reasonAbsent,
      isLogged: isLogged ?? this.isLogged,
      dontAskMeAgain: dontAskMeAgain ?? this.dontAskMeAgain,
      isUnitLeader: isUnitLeader ?? this.isUnitLeader,
      isWorker: isWorker ?? this.isWorker,
      resolution: resolution ?? this.resolution,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      annivassary: annivassary ?? this.annivassary,
      communityUnitLeading: communityUnitLeading ?? this.communityUnitLeading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'phoneNo': phoneNo,
      'whatsappNo': whatsappNo,
      'address': address,
      'neaerestBustop': neaerestBustop,
      'group': group,
      'nextOfKin': nextOfKin,
      'localGovtArea': localGovtArea,
      'email': email,
      'unit': unit,
      'community': community,
      'date': date,
      'time': time,
      'reasonAbsent': reasonAbsent,
      'isLogged': isLogged,
      'dontAskMeAgain': dontAskMeAgain,
      'isUnitLeader': isUnitLeader,
      'isWorker': isWorker,
      'resolution': resolution,
      'dateOfBirth': dateOfBirth,
      'annivassary': annivassary,
      'communityUnitLeading': communityUnitLeading,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] as String,
      uid: map['uid'] as String,
      phoneNo: map['phoneNo'] as String,
      whatsappNo: map['whatsappNo'] as String,
      address: map['address'] as String,
      neaerestBustop: map['neaerestBustop'] as String,
      group: map['group'] as String,
      nextOfKin: map['nextOfKin'] as String,
      localGovtArea: map['localGovtArea'] as String,
      email: map['email'] as String,
      unit: map['unit'] as String,
      community: map['community'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      reasonAbsent: map['reasonAbsent'] as String,
      isLogged: map['isLogged'] as bool,
      dontAskMeAgain: map['dontAskMeAgain'] as bool,
      isUnitLeader: map['isUnitLeader'] as bool,
      isWorker: map['isWorker'] as String,
      resolution: map['resolution'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      annivassary: map['annivassary'] as String,
      communityUnitLeading: map['communityUnitLeading'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) => Member.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(name: $name, uid: $uid, phoneNo: $phoneNo, whatsappNo: $whatsappNo, address: $address, neaerestBustop: $neaerestBustop, group: $group, nextOfKin: $nextOfKin, localGovtArea: $localGovtArea, email: $email, unit: $unit, community: $community, date: $date, time: $time, reasonAbsent: $reasonAbsent, isLogged: $isLogged, dontAskMeAgain: $dontAskMeAgain, isUnitLeader: $isUnitLeader, isWorker: $isWorker, resolution: $resolution, dateOfBirth: $dateOfBirth, annivassary: $annivassary, communityUnitLeading: $communityUnitLeading)';
  }

}
