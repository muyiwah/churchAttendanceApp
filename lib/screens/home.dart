import 'package:confirmation_success/confirmation_success.dart';
import 'package:flutter/material.dart';
import 'package:mivattendance/data.dart';
import 'package:mivattendance/global.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/drwer.dart';
import 'package:mivattendance/screens/new.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:mivattendance/screens/search_by_name.dart';
import 'package:mivattendance/screens/search_screen.dart';
import 'package:mivattendance/widgets/lottie_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MivHomePage extends StatefulWidget {
  static var icon;
  MivHomePage({super.key});

  @override
  State<MivHomePage> createState() => _MivHomePageState();
}

String selection = 'member';

class _MivHomePageState extends State<MivHomePage> {
  @override
  initState() {
    super.initState();
    fetchStaticNames();
  }

  int pageNo = 0;
  final _controller = PageController();
  List<Map<String, dynamic>> depts = [];
  List<Map<String, dynamic>> comunity = [];
  fetchStaticNames() {
    depts = Provider.of<UserProvider>(context, listen: false).depts;
    comunity = Provider.of<UserProvider>(context, listen: false).comunity;
  }

  List<Member> membersList = [];

  String newName = '';
  String personType = '';

  // Data data = Data();

  void addtoDatase() {
    Member newMember = Member(
      name: newName,
      unit: selection,
      isLogged: true,
      isWorker: 'isNotWorker',
      whatsappNo: '080123456789',
      resolution: 'resolved',
      phoneNo: '08023456789',
      address: 'n0 5,olororo street',
      neaerestBustop: 'Aduloju',
      group: 'Women',
      nextOfKin: 'Jumoke Adebunmi',
      localGovtArea: 'Akinyele',
      email: 'atm@gmail.com',
      annivassary: '3-4-1990',
      dateOfBirth: '12-1-1999',
      isUnitLeader: false,
    );
    // data.members.add(newMember);
    Provider.of<UserProvider>(context, listen: false).addMember(newMember);
    newName = '';
    setState(() {});
  }

  void addNew(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add to Database'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    addtoDatase();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          Responsive.isTablet(context) ? 200 : 100,
                          Responsive.isTablet(context) ? 50 : 40),
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
                      minimumSize: Size(
                          Responsive.isTablet(context) ? 200 : 100,
                          Responsive.isTablet(context) ? 50 : 40),
                      backgroundColor: Colors.red),
                )
              ],
              content: SingleChildScrollView(
                child: Container(
                    height: Responsive.isTablet(context) ? 300 : 150,
                    width: Responsive.isTablet(context) ? 400 : 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16),
                            // height: 80,
                            width: double.infinity,
                            child: TextField(
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                              onChanged: (value) {
                                newName = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Add name to database',
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            )),
                        CustomDrop()
                      ],
                    )),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        toolbarHeight: 60,
        // leading: InkWell(
        //     onTap: () {
        //       ScaffoldMessenger.of(context);
        //     },
        //     child: Icon(
        //       Icons.menu,
        //       color: Colors.white,
        //       size: 36,
        //     )),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
              onTap: () {
                addNew(context);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 36,
              )),
          const SizedBox(
            width: 9,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchName()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(2),
              child: const Row(
                children: [
                  Text(
                    'Search by name',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "WELCOME TO MIV   ",
          style: TextStyle(
            color: Colors.white,
            fontSize: Responsive.isTablet(context) ? 30 : 20,
          ),
        ),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: Stack(children: [
        PageView(controller: _controller, children: [
          //Department screen
          Container(
            padding: EdgeInsets.all(Responsive.isTablet(context) ? 20 : 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                itemCount: depts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // mainAxisSpacing: 20,
                    // crossAxisSpacing: 20,
                    mainAxisSpacing: Responsive.isTablet(context) ? 20 : 8,
                    crossAxisSpacing: Responsive.isTablet(context) ? 20 : 8,
                    childAspectRatio: Responsive.isTablet(context) ? 2 : 1.5,
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 3
                        : 2),
                itemBuilder: (context, index) {
                  List<Member> unitMembers = Provider.of<UserProvider>(context)
                      .sorter(depts[index]['unit']);
                  int counter = 0;
                  for (int x = 0; unitMembers.length > x; x++) {
                    if (unitMembers[x].isLogged) {
                      counter++;
                    }
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                dept: depts[index]['unit'],
                                fromDepartment: true)),
                      );
                    },
                    child: Stack(children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isTablet(context) ? 20 : 10,
                        ),
                        color: depts[index]['color'],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  depts[index]['unit'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Responsive.isTablet(context)
                                          ? 36
                                          : 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${counter}/',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .sorter(depts[index]['unit'])
                                          .length
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              depts[index]['image'],
                              scale: Responsive.isTablet(context) ? 8.0 : 13,
                            )
                          ],
                        ),
                      ),
                      if (Provider.of<UserProvider>(context)
                                  .sorter(depts[index]['unit'])
                                  .length ==
                              counter &&
                          counter != 0)
                        Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(
                              Icons.access_alarms_rounded,
                              color: Colors.red,
                            ))
                    ]),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(Responsive.isTablet(context) ? 20 : 10),
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                itemCount: comunity.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: Responsive.isTablet(context) ? 20 : 10,
                    crossAxisSpacing: Responsive.isTablet(context) ? 20 : 10,
                    childAspectRatio: 1.5,
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 3
                        : 2),
                itemBuilder: (context, index) {
                  List<Member> communityMembers =
                      Provider.of<UserProvider>(context)
                          .sorterCommunity(comunity[index]['unit']);
                  int counter = 0;
                  for (int x = 0; communityMembers.length > x; x++) {
                    if (communityMembers[x].isLogged) {
                      counter++;
                    }
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                dept: comunity[index]['unit'],
                                fromDepartment: false)),
                      );
                    },
                    child: Stack(children: [
                      Container(
                        padding: EdgeInsets.all(
                            Responsive.isTablet(context) ? 20 : 10),
                        color: comunity[index]['color'],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  comunity[index]['unit'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Responsive.isTablet(context)
                                          ? 32
                                          : 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${counter}/',
                                      style:  TextStyle(
                                          color: Colors.white,
                                          fontSize: Responsive.isTablet(context)
                                          ?  18:14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .sorterCommunity(
                                              comunity[index]['unit'])
                                          .length
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Icon(
                            //   comunity[index]['icon'],
                            //   size: 35,
                            // )
                          ],
                        ),
                      ),
                      if (Provider.of<UserProvider>(context)
                                  .sorterCommunity(comunity[index]['unit'])
                                  .length ==
                              counter &&
                          counter != 0)
                        Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(
                              Icons.access_alarms_rounded,
                              color: Colors.red,
                            ))
                    ]),
                  );
                }),
          ),
        ]),
        // Container(
        //       alignment: Alignment(0, 0.86),
        //      child: SmoothPageIndicator(controller: _controller, count: 2)
        //       ),
        Positioned(
          bottom: 30,
          left: 30,
          right: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => _controller.previousPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn),
                child: Text(
                  'prev',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SmoothPageIndicator(controller: _controller, count: 2),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => _controller.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn),
                child: Text(
                  'next',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CustomDrop extends StatefulWidget {
  CustomDrop({super.key});

  @override
  State<CustomDrop> createState() => _CustomDropState();
}

class _CustomDropState extends State<CustomDrop> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        style: const TextStyle(
            fontSize: 24, color: Colors.black, ),
        value: selection,
        items: [
          const DropdownMenuItem(value: 'member', child: Text('member')),
          const DropdownMenuItem(value: 'visitor', child: Text('visitor')),
        ],
        onChanged: (value) {
          selection = value!;
          setState(() {
            print(selection);
          });
        });
  }
}
