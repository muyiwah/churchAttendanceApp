import 'package:flutter/material.dart';
import 'package:mivattendance/global.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/check_resolve_member.dart';
import 'package:mivattendance/screens/new.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen(
      {super.key, required this.dept, required this.fromDepartment});
  final String dept;
  final bool fromDepartment;

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  List<Member> membersList = [];
  // Data data = Data();
  int b = 0;
  void fetch() {
    membersList = widget.fromDepartment
        ? Provider.of<UserProvider>(context, listen: false).sorter(widget.dept)
        : Provider.of<UserProvider>(context, listen: false)
            .sorterCommunity(widget.dept);
    membersList.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void unMarkAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).unClockIn(data);
    setState(() {});
  }

  void markAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).clockIn(data, date);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const MyWidget()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
        appBar: AppBar(actions: [Text('Click  name to clock in!\nLong press on name to undo!',style: TextStyle(fontSize: 14,color: Colors.white),)],
          title: Text(widget.dept),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<UserProvider>(builder: (context, user, _) {
          return Container(
            color: Colors.blueAccent.withOpacity(.2),
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
                itemCount: membersList.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        print(membersList[index].isLogged);
                        print(membersList[index].name);
                        membersList[index].isLogged
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'hi, ${membersList[index].name.split(' ')[0]} is already logged in')))
                            : markAttendance(membersList[index]);
                        // Navigator.pop(context);
                      },
                      onLongPress: () {
                        unMarkAttendance(membersList[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isTablet(context) ? 14 : 4),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        height: 80,
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}.',
                              style: TextStyle(
                                fontSize:
                                    Responsive.isTablet(context) ? 30 : 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                membersList[index].name,
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isTablet(context) ? 30 : 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CheckResolveMember(
                                                membersList[index])));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right:
                                        Responsive.isTablet(context) ? 12 : 4),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Responsive.isTablet(context)
                                          ? 22
                                          : 14),
                                ),
                              ),
                            ),
                            if (Responsive.isTablet(context) &&
                                membersList[index].isLogged)
                              Text(membersList[index].time),
                            membersList[index].isLogged
                                ? Container(
                                    margin: EdgeInsets.only(
                                        left: Responsive.isTablet(context)
                                            ? 20
                                            : 2),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Responsive.isTablet(context)
                                            ? 15
                                            : 8,
                                        vertical: Responsive.isTablet(context)
                                            ? 10
                                            : 6),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      'logged in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:Responsive.isTablet(context)? 18:14),
                                    ),
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color:(membersList[index].resolution=='resolved' ||membersList[index].dontAskMeAgain==true )?Colors.green: Colors.red,
                                    size: 33,
                                  )
                          ],
                        ),
                      ),
                    )),
          );
        }));
  }
}
