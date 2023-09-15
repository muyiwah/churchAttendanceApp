import 'package:flutter/material.dart';
import 'package:mivattendance/global.dart';
import 'package:mivattendance/models/analytics.dart';
import 'package:mivattendance/models/members.dart';

class UserProvider extends ChangeNotifier {
  List<AnalyticsModel> weeklyAnalysis = [
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-01-03'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-06-03'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-01-07'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 30,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-03-09'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 90,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-01-20'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 100,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 1,
        date: '2023-01-31'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 2,
        date: '2023-02-03'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 3,
        date: '2023-03-03'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 15,
        resolved: 13,
        unresloved: 18,
        present: 84,
        totalMembers: 128,
        newCommers: 19,
        workers: 120,
        nonWorkers: 18,
        teenagers: 50,
        children: 4,
        date: '2023-04-10'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 12,
        resolved: 17,
        unresloved: 3,
        present: 90,
        totalMembers: 148,
        newCommers: 12,
        workers: 125,
        nonWorkers: 14,
        teenagers: 43,
        children: 5,
        date: '2023-05-17'),
  AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 12,
        resolved: 17,
        unresloved: 3,
        present: 30,
        totalMembers: 148,
        newCommers: 12,
        workers: 125,
        nonWorkers: 14,
        teenagers: 43,
        children: 5,
        date: '2023-05-19'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 12,
        resolved: 17,
        unresloved: 3,
        present: 70,
        totalMembers: 148,
        newCommers: 12,
        workers: 125,
        nonWorkers: 14,
        teenagers: 43,
        children: 5,
        date: '2023-05-12'),  AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 13,
        resolved: 14,
        unresloved: 15,
        present: 84,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 6,
        date: '2023-06-24'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 7,
        date: '2023-07-12'),
    AnalyticsModel(
        men: 90,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 8,
        date: '2023-08-13'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 9,
        date: '2023-09-08'),
    AnalyticsModel(
        men: 14,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 10,
        date: '2023-10-08'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 11,
        date: '2023-11-08'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 12,
        date: '2023-12-15'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 13,
        date: '2023-12-20'),
    AnalyticsModel(
        men: 30,
        women: 40,
        abscent: 10,
        resolved: 12,
        unresloved: 13,
        present: 80,
        totalMembers: 128,
        newCommers: 9,
        workers: 120,
        nonWorkers: 18,
        teenagers: 40,
        children: 14,
        date: '2023-12-29'),
  ];

  List<Map<String, dynamic>> depts = [
    {
      'unit': 'choir',
      'color': Colors.pink,
      'image': 'lib/assets/choir.png',
    },
    {
      'unit': 'media',
      'color': Colors.blueGrey,
      'image': 'lib/assets/microphone2.png'
    },
    {
      'unit': 'integration',
      'color': Colors.blueGrey,
      'image': 'lib/assets/microphone2.png'
    },
    {
      'unit': 'prayer',
      'color': Colors.red,
      'image': 'lib/assets/cyber-security.png'
    },
    {
      'unit': 'sanitation',
      'color': Colors.green,
      'image': 'lib/assets/liquid-soap.png'
    },
    {
      'unit': 'protocol',
      'color': Colors.orangeAccent,
      'image': 'lib/assets/bodyguard.png'
    },
    {
      'unit': 'teens',
      'color': Colors.purple,
      'image': 'lib/assets/liquid-soap.png'
    },
    {
      'unit': 'children',
      'color': Colors.blue,
      'image': 'lib/assets/children.png'
    },
    {
      'unit': 'ushering',
      'color': Colors.blueAccent,
      'image': 'lib/assets/welcome.png'
    },
    {
      'unit': 'greeters',
      'color': Colors.deepPurpleAccent,
      'image': 'lib/assets/etiquette.png'
    },
    {
      'unit': 'follow_up',
      'color': Colors.green,
      'image': 'lib/assets/people.png'
    },
    {
      'unit': 'security',
      'color': Colors.purpleAccent,
      'image': 'lib/assets/guard.png'
    },
    {
      'unit': 'technicals',
      'color': Colors.redAccent,
      'image': 'lib/assets/skills.png'
    },
    {
      'unit': 'missions',
      'color': Colors.redAccent,
      'image': 'lib/assets/teamwork.png'
    },
    {
      'unit': 'sanctuary',
      'color': Colors.redAccent,
      'image': 'lib/assets/church1.png'
    },
    {
      'unit': 'member',
      'color': Colors.lightBlueAccent,
      'image': 'lib/assets/teamwork.png'
    },
    {
      'unit': 'visitation',
      'color': Colors.lightBlueAccent,
      'image': 'lib/assets/welcome.png'
    },
  ];
  List<Map<String, dynamic>> comunity = [
    {
      'unit': 'Community 1',
      'color': Colors.blue,
      'icon': Icons.abc,
    },
    {'unit': 'Community 2', 'color': Colors.pink, 'icon': Icons.abc},
    {'unit': 'Community 3', 'color': Colors.purple, 'icon': Icons.abc},
    {'unit': 'Community 4', 'color': Colors.blueAccent, 'icon': Icons.abc},
    {'unit': 'Community 5', 'color': Colors.orangeAccent, 'icon': Icons.abc},
    {'unit': 'Community 6', 'color': Colors.red, 'icon': Icons.abc},
    {
      'unit': 'Community 7',
      'color': Colors.deepPurpleAccent,
      'icon': Icons.abc
    },
    {'unit': 'Community 8', 'color': Colors.blueAccent, 'icon': Icons.abc},
    {'unit': 'Community 9', 'color': Colors.redAccent, 'icon': Icons.abc},
    {'unit': 'Community 10', 'color': Colors.green, 'icon': Icons.abc},
    {'unit': 'Community 11', 'color': Colors.pink, 'icon': Icons.abc},
    {'unit': 'Community 12', 'color': Colors.blueGrey, 'icon': Icons.abc},
  ];

  List<Member> members = [
    Member(
      communityUnitLeading: 'media',
      name: 'Olubunmi Taiwo',
      unit: 'media',
      isLogged: false,
      community: 'Community 1',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Men',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-09-07',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Olubunmi Jumoke',
      unit: 'choir',
      isLogged: false,
      community: 'Community 2',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-09-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      communityUnitLeading: 'Community 2',
      name: 'Emmanuel EnifeOluwa',
      unit: 'media',
      isLogged: false,
      community: 'Community 2',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-11',
      dateOfBirth: '2023-09-7',
      whatsappNo: '080123456789',
      isUnitLeader: true,
    ),
    Member(
      communityUnitLeading: 'choir',
      name: 'Seun Adetunji',
      unit: 'choir',
      isLogged: false,
      community: 'Community 4',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-09-14',
      dateOfBirth: '2023-07-08',
      whatsappNo: '080123456789',
      isUnitLeader: true,
    ),
    Member(
      communityUnitLeading: 'Community 4',
      name: 'Adeola shina',
      unit: 'protocol',
      isLogged: false,
      community: 'Community 5',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Omesi ola',
      unit: 'sanitation',
      isLogged: false,
      community: 'Community 6',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      communityUnitLeading: 'Community 7',
      name: 'Frances Bunmi',
      unit: 'sanctuary',
      isLogged: false,
      community: 'Community 7',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Araoluwa Olubunmi',
      unit: 'protocol',
      isLogged: false,
      community: 'Community 8',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Promis Okenna',
      unit: 'usering',
      isLogged: false,
      community: 'Community 9',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Olu Gbenga',
      unit: 'integration',
      isLogged: false,
      community: 'Community 9',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Godwin Okenna',
      unit: 'integration',
      isLogged: false,
      community: 'Community 9',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Adeoti shina',
      unit: 'Techincal',
      isLogged: false,
      community: 'Community 10',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Obinna obetta',
      unit: 'choir',
      isLogged: false,
      community: 'Community 1',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Soji adeniyi',
      unit: 'protocol',
      isLogged: false,
      community: 'Community 2',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Laolu ife',
      unit: 'prayer',
      isLogged: false,
      community: 'Community 3',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Eniola alao',
      unit: 'greeters',
      isLogged: false,
      community: 'Community 4',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      communityUnitLeading: 'security',
      name: 'Bunmi oluwaseun',
      unit: 'security',
      isLogged: false,
      community: 'Community 5',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      communityUnitLeading: 'Community 6',
      name: 'prosper adeo',
      unit: 'security',
      isLogged: false,
      community: 'Community 6',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      communityUnitLeading: 'prayer',
      name: 'Oluwaseun oua',
      unit: 'prayer',
      isLogged: false,
      community: 'Community 7',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Adesola Adesune',
      unit: 'visitation',
      isLogged: false,
      community: 'Community 8',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'lawal Adekitan',
      unit: 'protocol',
      isLogged: false,
      community: 'Community 9',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Shine Tajudeen',
      unit: 'teens',
      isLogged: false,
      community: 'Community 10',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Ireti Adekanbi',
      unit: 'children',
      isLogged: false,
      community: 'Community 1',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Omesi ola',
      unit: 'sanitation',
      isLogged: false,
      community: 'Community 2',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Adebisi Bunmi',
      unit: 'follow up',
      isLogged: false,
      community: 'Community 3',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Akin Bada',
      unit: 'technicals',
      isLogged: false,
      community: 'Community 4',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Promis Johnson',
      unit: 'usering',
      isLogged: false,
      community: 'Community 5',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: true,
    ),
    Member(
      communityUnitLeading: 'Community 3',
      name: 'Adeoti shina',
      unit: 'Techincal',
      isLogged: false,
      community: 'Community 6',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Obinna obetta',
      unit: 'choir',
      isLogged: false,
      community: 'Community 7',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Shina Olu',
      unit: 'protocol',
      isLogged: false,
      community: 'Community 8',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Laolu ife',
      unit: 'prayer',
      isLogged: false,
      community: 'Community 9',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Godfrey alao',
      unit: 'greeters',
      isLogged: false,
      community: 'Community 10',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Bunmi oluwaseun',
      unit: 'security',
      isLogged: false,
      community: 'Community 1',
      isWorker: 'isworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Fatai adeo',
      unit: '',
      isLogged: false,
      community: '',
      isWorker: 'isnotworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Banki adeo',
      unit: '',
      isLogged: false,
      community: '',
      isWorker: 'isnotworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
    Member(
      name: 'Aje adeo',
      unit: '',
      isLogged: false,
      community: '',
      isWorker: 'isnotworker',
      resolution: 'unResolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Olubunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '2023-10-08',
      dateOfBirth: '2023-11-08',
      whatsappNo: '080123456789',
      isUnitLeader: false,
    ),
  ];
  List<Member> allMembers = [];
  List<Member> sorter(member) {
    List<Member> deptMember = [];
    allMembers = [];
    allMembers = deptMember;
    for (int y = 0; members.length > y; y++) {
      // print(members[y].unit);
      // print(y);
      if (members[y].unit == member) {
        deptMember.add(members[y]);
      }
    }
    return deptMember;
  }

  List<Member> allCommunityMembers = [];
  List<Member> sorterCommunity(member) {
    List<Member> commuunityMember = [];
    allCommunityMembers = [];
    allCommunityMembers = commuunityMember;
    for (int y = 0; members.length > y; y++) {
      // print(members[y].unit);
      // print(y);
      if (members[y].community == member) {
        commuunityMember.add(members[y]);
      }
    }
    return commuunityMember;
  }

  List<Member> get membersList => allMembers;
  void addMember(data) {
    members.add(data);
    notifyListeners();
  }

  void clockIn(Member data, date) {
    print(data.name);
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(data.name);
      if (relation == 0) {
        members[i].isLogged = true;
        members[i].date = date.toString().split(" ")[0];
        members[i].time = date.toString().split(" ")[1].split(".")[0];
      }
    }
    notifyListeners();
  }

  String findLeadingUnitCommunity(unitCommunity) {
    String leading = '';
    print(unitCommunity);

    for (int y = 0; members.length > y; y++) {
      print(members[y].communityUnitLeading);
      // print(members[y].name);
      // print(y);
      if (members[y].communityUnitLeading == unitCommunity) {
        leading = members[y].name;
        print(leading);
        return leading;
      }
    }
    print(leading);
    return leading;
  }

  String findPhoneOfLeadingUnitCommunity(unitCommunity) {
    String leading = '';
    print(unitCommunity);

    for (int y = 0; members.length > y; y++) {
      print(members[y].communityUnitLeading);
      // print(members[y].name);
      // print(y);
      if (members[y].communityUnitLeading == unitCommunity) {
        print('hello');
        leading = members[y].phoneNo;
        return leading;
      }
    }
    print(leading);
    return leading;
  }

  String findWhatsappOfLeadingUnitCommunity(unitCommunity) {
    String leading = '';
    print(unitCommunity);

    for (int y = 0; members.length > y; y++) {
      // print(members[y].communityUnitLeading);
      // print(members[y].name);
      // print(y);
      if (members[y].communityUnitLeading == unitCommunity) {
        leading = members[y].whatsappNo;
        return leading;
      }
    }
    print(leading);
    return leading;
  }

  void unClockIn(Member data) {
    print(data.name);
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(data.name);
      if (relation == 0) {
        members[i].isLogged = false;
        members[i].date = "";
        members[i].time = "";
      }
    }
    notifyListeners();
  }

  whyMemberIsAbsent(memberName, reason) {
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(memberName);
      if (relation == 0) {
        members[i].reasonAbsent = reason;
        members[i].resolution = 'resolved';
      }
    }
    notifyListeners();
  }

  updateMemberDetail(data) {
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(data.name);
      if (relation == 0) {
        print(members[i].name);
        print(data);
        members[i] = data;
        print(members[i].name);
      }
    }
    notifyListeners();
  }

  deleteMember(Member data) {
    members
        .removeAt(members.indexWhere((element) => element.name == data.name));

    notifyListeners();
  }

  markAsDoNotRemindMe(memberName) {
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(memberName);
      if (relation == 0) {
        members[i].dontAskMeAgain = true;
      }
    }
    notifyListeners();
  }

  markAsRemindMe(memberName) {
    for (int i = 0; members.length > i; i++) {
      int relation = members[i].name.compareTo(memberName);
      if (relation == 0) {
        members[i].dontAskMeAgain = false;
      }
    }
    notifyListeners();
  }

  addMemberToDatabase(data) {
    members.add(data);
    notifyListeners();
  }

  List<AnalyticsModel> findYearMonth(data) {
    List<AnalyticsModel> group = [];
    for (int i = 0; weeklyAnalysis.length > i; i++) {
      if (weeklyAnalysis[i].date.contains(data)) {
        group.add(weeklyAnalysis[i]);
      }
    }
    return group;
  }

  String year = "${date.toString().split(' ')[0].split('-')[0]}";
  String januaryMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-01";
  String februaryMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-02";
  String marchMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-03";
  String apirilMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-04";
  String mayMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-05";
  String juneMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-06";
  String julyMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-07";
  String augustMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-08";
  String septemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-09";
  String octoberMonthYear = "${date.toString().split(' ')[0].split('-')[0]}-10";
  String novemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-11";
  String decemberMonthYear =
      "${date.toString().split(' ')[0].split('-')[0]}-12";

  String findReturnMonthString(data) {
    String result = '';

    if (data.contains(januaryMonthYear)) {
      result = 'January';
    } else if (data.contains(februaryMonthYear)) {
      result = 'February';
    } else if (data.contains(marchMonthYear)) {
      result = 'March';
    } else if (data.contains(apirilMonthYear)) {
      result = 'April';
    } else if (data.contains(mayMonthYear)) {
      result = 'May';
    } else if (data.contains(juneMonthYear)) {
      result = 'June';
    } else if (data.contains(julyMonthYear)) {
      result = 'July';
    } else if (data.contains(augustMonthYear)) {
      result = 'August';
    } else if (data.contains(septemberMonthYear)) {
      result = 'September';
    } else if (data.contains(octoberMonthYear)) {
      result = 'October';
    } else if (data.contains(novemberMonthYear)) {
      result = 'November';
    } else if (data.contains(decemberMonthYear)) {
      result = 'December';
    }

    return result;
  }

  List<Member> unresolvedMembers = [];
  List<Member> sortUnresolved(dept) {
    List<Member> deptMember = [];
    unresolvedMembers = [];
    unresolvedMembers = deptMember;
    for (int y = 0; members.length > y; y++) {
      if (members[y].unit == dept) {
        if (members[y].resolution == 'unResolved') {
          deptMember.add(members[y]);
        }
      }
    }
    return deptMember;
  }

  List<Member> unresolvedCommunityMembers = [];
  List<Member> sortUnresolvedCommunity(community) {
    List<Member> deptMember = [];
    unresolvedMembers = [];
    unresolvedMembers = deptMember;
    for (int y = 0; members.length > y; y++) {
      if (members[y].community == community) {
        if (members[y].resolution == 'unResolved') {
          deptMember.add(members[y]);
        }
      }
    }
    return deptMember;
  }
}
