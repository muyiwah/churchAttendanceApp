import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class AllMembers extends StatefulWidget {
  const AllMembers({super.key});

  @override
  State<AllMembers> createState() => _AllMembersState();
}

class _AllMembersState extends State<AllMembers> {
  @override
  initState() {
    fetchMembers();

    super.initState();
  }

  fetchMembers() {
    membersList = Provider.of<UserProvider>(context, listen: false).members;
  membersList.sort((a, b) => a.name.compareTo(b.name)); }

  void unMarkAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).unClockIn(data);
    setState(() {});
  }

  String editedName = "";
  List<Member> searchedMembersList = [];
  bool notFound = false;
  List<Member> membersList = [];
  List<Member> displayMembersList = [];

  // String searchText = '';
  // Data data = Data();
  search(searchText) {
    if (searchText.isNotEmpty) {
      notFound = false;
      searchedMembersList.clear();
      for (Member mem in membersList) {
        if (mem.name.toLowerCase().contains(searchText.toLowerCase())) {
          // print(mem.name);
          searchedMembersList.add(mem);
        }
      }
      // searchedMembersList.forEach((e) => print(e.name));
      setState(() {});
    }
    if (searchText.isNotEmpty && searchedMembersList.isEmpty) {
      notFound = true;
      setState(() {});
    }
  }

  void edit(Member data) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.name),
                  if (data.unit == 'member' || data.unit == 'visitor')
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Edit Name',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                ],
              ),
              content: Container(
                  height: 300,
                  width: 400,
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Row(children: [
                          Text('New Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          Text('editedName'),
                        ]),
                        SizedBox(
                            height: 40,
                            child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())))
                      ]))),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // addtoDatase();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Update Changes',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(190, 50),
                      backgroundColor: Colors.deepPurple),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(190, 50),
                      backgroundColor: Colors.red),
                )
              ],
            ));
  }

  void ubmark(Member data) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.name),
                  if (data.unit == 'member' || data.unit == 'visitor')
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Edit Name',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                ],
              ),
              content: Container(
                height: 300,
                width: 400,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Members11'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                height: 80,
                width: double.infinity,
                child: TextField(
                  onChanged: (value) {
                    search(value);
                  },
                  decoration: InputDecoration(
                      hintText: 'Search by name',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                )),
            Expanded(
              child: !notFound
                  ? ListView.builder(
                      itemCount: searchedMembersList.isEmpty
                          ? membersList.length
                          : searchedMembersList.length,
                      itemBuilder: (context, index) {
                        if (searchedMembersList.isNotEmpty) {
                          displayMembersList = searchedMembersList;
                        } else {
                          displayMembersList = membersList;
                        }
                       
                        return InkWell(
                          onTap: () {
                            if (displayMembersList[index].unit == 'member' ||
                                displayMembersList[index].unit == 'visitor') {
                              edit(displayMembersList[index]);
                            } else {
                              unMarkAttendance(displayMembersList[index]);
                            }
                          },
                          child: ListTile(
                            title: Text(displayMembersList[index].name,
                                style: TextStyle(fontSize: Responsive.isTablet(context)?26:20)),
                            subtitle: displayMembersList[index].isLogged
                                ? Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                                horizontal: Responsive.isTablet(context)
                                                        ? 8
                                                        : 2, vertical: 3),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text('logged at',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green)),
                                      ),
                                      Text(displayMembersList[index].time,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red)),
                                      SizedBox(
                                        width: Responsive.isTablet(context)
                                            ? 30: 8,
                                      ),
                                      Text(
                                          displayMembersList[index].unit == 'member'
                                              ? 'member'
                                              : displayMembersList[index].unit ==
                                                      'visitor'
                                                  ? 'visitor'
                                                  : displayMembersList[index].unit,
                                          style: TextStyle(
                                              fontSize: Responsive.isTablet(context)?20:16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text('Not logged-in',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: Responsive.isTablet(context)
                                            ? 30: 8,
                                      ),
                                      Text(
                                          displayMembersList[index].unit == 'member'
                                              ? 'member'
                                              : displayMembersList[index].unit ==
                                                      'visitor'
                                                  ? 'visitor'
                                                  : displayMembersList[index].unit,
                                          style: TextStyle(
                                              fontSize:Responsive.isTablet(context)? 20:15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  ),
                            leading: CircleAvatar(),
                            trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 7),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  displayMembersList[index].unit == 'member'
                                      ? 'edit'
                                      : displayMembersList[index].unit == 'visitor'
                                          ? 'edit'
                                          : displayMembersList[index].isLogged
                                              ? 'unmark'
                                              : '      ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ),
                        );
                      })
                  : Center(
                      child: Text('Name not found'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
