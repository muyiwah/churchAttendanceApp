import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:mivattendance/data.dart';
import 'package:mivattendance/global.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/new.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.dept,required this.fromDepartment});
  final String dept;
  final bool fromDepartment;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Member> membersList = [];
  // Data data = Data();
  int b = 0;
  void fetch() {
   membersList =
       widget.fromDepartment?  Provider.of<UserProvider>(context, listen: false).sorter(widget.dept):Provider.of<UserProvider>(context, listen: false).sorterCommunity(widget.dept);
   membersList.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void markAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).clockIn(data,date);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyWidget()));
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
        appBar: AppBar(actions: [Text('click on your\nname to clock in',style: TextStyle(fontSize: 18,color: Colors.white),)],
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
                       
                        membersList[index].isLogged
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('hi ${ membersList[index].name.split(' ')[0]} you are already logged in')))
                            : markAttendance(membersList[index]);
                        // Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Responsive.isTablet(context)?14:8),
                        margin: EdgeInsets.all(Responsive.isTablet(context)?12:9),
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
                                fontSize: Responsive.isTablet(context) ? 30
                                        : 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                membersList[index].name,
                                style: TextStyle(
                                  fontSize: Responsive.isTablet(context) ? 30:25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                           membersList[index].isLogged?Text(membersList[index].time):Text(''),
                            membersList[index].isLogged
                                ? Container(margin: EdgeInsets.only(left:
                                           Responsive.isTablet(context)
                                            ? 20
                                               : 15),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Responsive.isTablet(context)
                                            ? 15
                                                : 10, vertical: Responsive.isTablet(context)
                                            ? 10
                                                : 7),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      'logged in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Responsive.isTablet(context)
                                              ? 18:14),
                                    ),
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: (membersList[index].resolution ==
                                                'resolved' ||
                                            membersList[index].dontAskMeAgain ==
                                                true)
                                        ? Colors.green
                                        : Colors.red,
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
