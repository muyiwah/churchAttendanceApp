import 'package:flutter/material.dart';
import 'package:mivattendance/data.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/new.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class SearchName extends StatefulWidget {
  SearchName({super.key});

  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMembers();
  }
  DateTime date = DateTime.now();


  fetchMembers() {
    membersList = Provider.of<UserProvider>(context,listen: false).members;
  membersList.sort((a, b) => a.name.compareTo(b.name)); }
void markAttendance(data) {
    Provider.of<UserProvider>(context, listen: false).clockIn(data,date);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyWidget()));
  }
  List<Member> searchedMembersList = [];
  bool notFound = false;
  List<Member> membersList = [];
  // String searchText = '';
  // Data data = Data();
  search(searchText) {
    if (searchText.isNotEmpty) {
      notFound = false;
      searchedMembersList.clear();
      for (Member mem in membersList) {
        if (mem.name.toLowerCase().contains(searchText.toLowerCase())) {
          searchedMembersList.add(mem);
        }
      }
      print(searchedMembersList.length);
      setState(() {});
    }
    if (searchText.isNotEmpty && searchedMembersList.isEmpty) {
      notFound = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      actions: [
          Text(
            'click on your\nname to clock in   ',
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(.2),
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
                      hintText: 'Search for your name',
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
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                           
                              membersList[index].isLogged
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('hi ${ membersList[index].name.split(' ')[0]} you are already logged in')))
                            : markAttendance(membersList[index]);
                              
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              margin: EdgeInsets.all(Responsive.isTablet(context)?12:6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              height:Responsive.isTablet(context)? 80:50,
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${index + 1}. ',
                                    style: TextStyle(
                                      fontSize: Responsive.isTablet(context)?30:20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      searchedMembersList.isEmpty
                                          ? membersList[index].name
                                          : searchedMembersList[index].name,
                                      style: TextStyle(
                                        fontSize: Responsive.isTablet(context)? 30:20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${(searchedMembersList.isEmpty ? membersList[index].unit : searchedMembersList[index].unit)}",
                                    style: TextStyle(
                                        fontSize: Responsive.isTablet(context)?20:16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue),
                                  ),
                                  // Spacer(),
                            if(Responsive.isTablet(context))   membersList[index].isLogged?Text(membersList[index].time):Text(''),
                            membersList[index].isLogged
                                ? Container(margin: EdgeInsets.only(left:20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:Responsive.isTablet(context)? 15:7, vertical:Responsive.isTablet(context)? 10:5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      'logged in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color:
                                            (membersList[index].resolution ==
                                                          'resolved' ||
                                                      membersList[index]
                                                              .dontAskMeAgain ==
                                                          true)
                                                  ? Colors.green
                                                  : Colors.red,
                                    size:Responsive.isTablet(context)? 33:28,
                                  )
            
                                ],
                              ),
                            ),
                          ))
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
