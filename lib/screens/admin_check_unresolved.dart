import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/member_detail_screen.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

String selection = 'All members';

class Unresolved extends StatefulWidget {
  const Unresolved({super.key});

  @override
  State<Unresolved> createState() => _UnresolvedState();
}

class _UnresolvedState extends State<Unresolved> {
  @override
  initState() {
    fetchMembers();

    super.initState();
  }

  fetchMembers() {
    membersList = Provider.of<UserProvider>(context, listen: false).members;
    membersList.sort((a, b) => a.name.compareTo(b.name));
  }

  void unMarkAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).unClockIn(data);
    setState(() {});
  }

  String editedName = "";
  List<Member> searchedMembersList = [];
  bool notFound = false;
  List<Member> membersList = [];
  List<Member> SortedMembersList = [];
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

  sortMembers(searchText) {
    if (searchText.isNotEmpty) {
      notFound = false;
      searchedMembersList.clear();
      for (Member mem in membersList) {
        if (mem.community.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.unit.toLowerCase().contains(searchText.toLowerCase())) {
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

  doSorting(searchText) {
    print('searchText');
    if (searchText == 'All members') {
      searchedMembersList.clear();
      fetchMembers();
      for (var element in membersList) {
        searchedMembersList.add(element);
      }
      setState(() {});
    } else if (searchText.isNotEmpty) {
      notFound = false;
      searchedMembersList.clear();
      for (Member mem in membersList) {
        if (mem.community.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.unit.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.isWorker.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.resolution.toLowerCase().contains(searchText.toLowerCase())) {
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
                  child: const SingleChildScrollView(
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
        title: Text('All Members'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(16),
                    height: Responsive.isTablet(context) ? 80 : 70,
                    width: Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width - 300
                        : MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      onChanged: (value) {
                        search(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    )),
                SizedBox(
                    width: Responsive.isTablet(context) ? 200 : 100,
                    child: CustomDrop(
                      sortMembers: (data) {
                        data;
                        doSorting(data);
                      },
                    ))
              ],
            ),
            Expanded(
              child: !notFound
                  ? ListView.builder(
                      itemCount: searchedMembersList.isEmpty
                          ? membersList.length
                          : searchedMembersList.length,
                      itemBuilder: (context, index) {
                        int counter = index + 1;
                        if (searchedMembersList.isNotEmpty) {
                          displayMembersList = searchedMembersList;
                        } else {
                          displayMembersList = membersList;
                        }
                        return ListTile(contentPadding: EdgeInsets.all(5),
                          title: Text('${counter}. ${displayMembersList[index].name}',
                              style: TextStyle(fontSize: 20)),
                          subtitle: displayMembersList[index].isLogged
                              ? Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsetsDirectional.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text('logged at',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green)),
                                    ),
                                    Text(displayMembersList[index].time,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red)),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                        displayMembersList[index].unit ==
                                                'member'
                                            ? 'member'
                                            : displayMembersList[index].unit ==
                                                    'visitor'
                                                ? 'visitor'
                                                : displayMembersList[index]
                                                    .unit,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue)),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text('Not logged-in',
                                        style: TextStyle(fontSize: 16,color: Colors.grey)),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                        displayMembersList[index].unit ==
                                                'member'
                                            ? 'member'
                                            : displayMembersList[index].unit ==
                                                    'visitor'
                                                ? 'visitor'
                                                : displayMembersList[index]
                                                    .unit,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue)),
                                  ],
                                ),
                          // leading: MediaQuery.of(context).size.width>450? CircleAvatar():Text('')
                          trailing: Container(
                            width: Responsive.isTablet(context) ? 300 : 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Responsive.isTablet(context)
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MemberDetailScreen(
                                                          displayMembersList[
                                                              index])));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    Responsive.isTablet(context)
                                                        ? 15
                                                        : 12),
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                Responsive.isTablet(context)
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: (displayMembersList[index]
                                                  .isLogged)
                                              ? Colors.green
                                              : (!displayMembersList[index]
                                                          .isLogged &&
                                                      displayMembersList[index]
                                                              .resolution ==
                                                          "resolved")
                                                  ? Colors.orange
                                                  : Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          displayMembersList[index].isLogged
                                              ? 'In church'
                                              : ((!displayMembersList[index]
                                                              .isLogged &&
                                                          displayMembersList[
                                                                      index]
                                                                  .resolution ==
                                                              "resolved") ||
                                                      displayMembersList[index]
                                                              .dontAskMeAgain ==
                                                          true)
                                                  ? 'Absent/Resolved'
                                                  : 'Absent/Unresolved',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      450
                                                  ? 20
                                                  : 12),
                                        ))
                                    : InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MemberDetailScreen(
                                                          displayMembersList[
                                                              index])));
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: (displayMembersList[index]
                                                      .isLogged)
                                                  ? Colors.green
                                                  : ((!displayMembersList[index]
                                                                  .isLogged &&
                                                              displayMembersList[
                                                                          index]
                                                                      .resolution ==
                                                                  "resolved") ||
                                                          displayMembersList[
                                                                      index]
                                                                  .dontAskMeAgain ==
                                                              true)
                                                      ? Colors.orange
                                                      : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              displayMembersList[index].isLogged
                                                  ? 'In church'
                                                  : ((!displayMembersList[index]
                                                                  .isLogged &&
                                                              displayMembersList[
                                                                          index]
                                                                      .resolution ==
                                                                  "resolved") ||
                                                          displayMembersList[
                                                                      index]
                                                                  .dontAskMeAgain ==
                                                              true)
                                                      ? 'Absent/Resolved'
                                                      : 'Absent/Unresolved',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      Responsive.isTablet(context)
                                                          ? 20
                                                          : 11),
                                            )),
                                      ),
                              ],
                            ),
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

class CustomDrop extends StatefulWidget {
  CustomDrop({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<CustomDrop> createState() => _CustomDropState();
}

class _CustomDropState extends State<CustomDrop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              fontSize: Responsive.isTablet(context) ? 24 : 17,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          value: selection,
          items: const [
            DropdownMenuItem(
                value: 'All members',
                child: Text(
                  'All members',
                  style: TextStyle(color: Colors.blue),
                )),
            DropdownMenuItem(
                value: 'isWorker',
                child: Text(
                  'All workers',
                  style: TextStyle(color: Colors.green),
                )),
            DropdownMenuItem(
                value: 'isNotWorker',
                child: Text(
                  'Non workers',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                )),
            DropdownMenuItem(
                value: 'unResolved',
                child: Text(
                  'Absent Unresolved',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )),
            DropdownMenuItem(value: 'media', child: Text('media')),
            DropdownMenuItem(value: 'choir', child: Text('choir')),
            DropdownMenuItem(value: 'ushering', child: Text('ushering')),
            DropdownMenuItem(value: 'prayer', child: Text('prayer')),
            DropdownMenuItem(value: 'protocol', child: Text('protocol')),
            DropdownMenuItem(value: 'children', child: Text('children')),
            DropdownMenuItem(value: 'sanctuary', child: Text('sanctuary')),
            DropdownMenuItem(value: 'technical', child: Text('technical')),
            DropdownMenuItem(value: 'security', child: Text('security')),
            DropdownMenuItem(value: 'integration', child: Text('integration')),
            DropdownMenuItem(value: 'greeters', child: Text('greeters')),
            DropdownMenuItem(value: 'Community 1', child: Text('community 1')),
            DropdownMenuItem(value: 'Community 2', child: Text('community 2')),
            DropdownMenuItem(value: 'Community 3', child: Text('community 3')),
            DropdownMenuItem(value: 'Community 4', child: Text('community 4')),
            DropdownMenuItem(value: 'Community 5', child: Text('community 5')),
            DropdownMenuItem(value: 'Community 6', child: Text('community 6')),
            DropdownMenuItem(value: 'Community 7', child: Text('community 7')),
            DropdownMenuItem(value: 'Community 8', child: Text('community 8')),
            DropdownMenuItem(value: 'Community 9', child: Text('community 9')),
            DropdownMenuItem(
                value: 'Community 10', child: Text('community 10')),
          ],
          onChanged: (value) {
            selection = value!;
            setState(() {
              widget.sortMembers(selection);
            });
          }),
    );
  }
}
