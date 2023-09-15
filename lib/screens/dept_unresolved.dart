import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/check_resolve_member.dart';
import 'package:mivattendance/screens/member_detail_screen.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class DepartmentUnresolved extends StatefulWidget {
  const DepartmentUnresolved({super.key});

  @override
  State<DepartmentUnresolved> createState() => _DepartmentUnresolvedState();
}

class _DepartmentUnresolvedState extends State<DepartmentUnresolved> {
  @override
  initState() {
    super.initState();
    fetchStaticNames();
  }

  List<Map<String, dynamic>> depts = [];
  List<Map<String, dynamic>> comunity = [];
  List<Member> membersList = [];
  fetchStaticNames() {
    depts = Provider.of<UserProvider>(context, listen: false).depts;
    comunity = Provider.of<UserProvider>(context, listen: false).comunity;
    membersList = Provider.of<UserProvider>(context, listen: false).members;
  }

  int unresolvedSum = 0;
  int unresolvedCommunitySum = 0;
  showUnresolvedBottomModal(data) {
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) => Container(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    int counter = index + 1;
                    return ListTile(
                      title: Text('${counter}. ${data[index].name}',
                          style: TextStyle(fontSize: 18)),
                      trailing: InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MemberDetailScreen(data[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: Responsive.isTablet(context) ? 12 : 4),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Details',
                            style: TextStyle(
                                color: Colors.green,
                               
                                fontSize:
                                    Responsive.isTablet(context) ? 22 : 18),
                          ),
                        ),
                      ),
                    );
                  })),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(
                  text: 'Departments',
                ),
                Tab(
                  text: 'Community',
                )
              ]),
            ),
            body:
                TabBarView(children: [DepartmentScreen(), CommunityScreen()])));
  }

  Container CommunityScreen() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 17,
            child: ListView.builder(
                itemCount: comunity.length,
                itemBuilder: (context, index) {
                unresolvedCommunitySum =
                      Provider.of<UserProvider>(context, listen: false)
                              .sortUnresolvedCommunity(comunity[index]['unit'])
                              .length
                              .toInt() +
                          unresolvedCommunitySum;
                  print(unresolvedCommunitySum); 
                    int counter = index + 1;
                 
                 
                  return ListTile(
                    title: Text(
                      "${counter}. ${comunity[index]['unit']}",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        // Provider.of<UserProvider>(context, listen: false)
                        //     .sortUnresolved(depts[index]['unit'])
                        //     .forEach((element) {
                        //   print(element.name);
                        // });
                        if (Provider.of<UserProvider>(context, listen: false)
                            .sortUnresolvedCommunity(comunity[index]['unit'])
                            .isNotEmpty) {
                          showUnresolvedBottomModal(
                              Provider.of<UserProvider>(context, listen: false)
                                  .sortUnresolvedCommunity(
                                      comunity[index]['unit']));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'No abstentee in ${comunity[index]['unit']}')));
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Provider.of<UserProvider>(context)
                                    .sortUnresolvedCommunity(
                                        comunity[index]['unit'])
                                    .length >
                                0
                            ? Colors.red
                            : Colors.green,
                        child: Text(
                          Provider.of<UserProvider>(context)
                              .sortUnresolvedCommunity(comunity[index]['unit'])
                              .length
                              .toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: unresolvedCommunitySum > 0 ? Colors.red : Colors.green,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total absent/unresolved =' ,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      unresolvedCommunitySum.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Container DepartmentScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 16,
            child: ListView.builder(
                itemCount: depts.length,
                itemBuilder: (context, index) {
                  unresolvedSum =
                      Provider.of<UserProvider>(context, listen: false)
                              .sortUnresolved(depts[index]['unit'])
                              .length
                              .toInt() +
                          unresolvedSum;
                  int counter = index + 1;
                  return ListTile(
                    title: Text(
                      "${counter}. ${depts[index]['unit']}",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        // Provider.of<UserProvider>(context, listen: false)
                        //     .sortUnresolved(depts[index]['unit'])
                        //     .forEach((element) {
                        //   print(element.name);
                        // });
                        if (Provider.of<UserProvider>(context, listen: false)
                            .sortUnresolved(depts[index]['unit'])
                            .isNotEmpty) {
                          showUnresolvedBottomModal(
                              Provider.of<UserProvider>(context, listen: false)
                                  .sortUnresolved(depts[index]['unit']));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'No abstentee in ${depts[index]['unit']}')));
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Provider.of<UserProvider>(context)
                                    .sortUnresolved(depts[index]['unit'])
                                    .length >
                                0
                            ? Colors.red
                            : Colors.green,
                        child: Text(
                          Provider.of<UserProvider>(context)
                              .sortUnresolved(depts[index]['unit'])
                              .length
                              .toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: unresolvedSum > 0 ? Colors.red : Colors.green,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Total absent/unresolved = $unresolvedSum',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
