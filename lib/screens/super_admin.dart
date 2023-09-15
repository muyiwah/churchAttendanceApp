import 'dart:async';
import 'dart:convert';

import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/add_new_member.dart';
import 'package:mivattendance/screens/data_entry.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';

class SuperAdminScreen extends StatefulWidget {
  const SuperAdminScreen({Key? key}) : super(key: key);

  @override
  State<SuperAdminScreen> createState() => _SuperAdminScreenState();
}

String selection = 'All members';

int counter = 0;
DateTime datetime2 = DateTime.now();
DateTime date = DateTime.now();

class _SuperAdminScreenState extends State<SuperAdminScreen> {
  late List<ExpandableColumn<dynamic>> headers;
  late List<ExpandableRow> rows;

  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    time!.cancel();
    debounce!.cancel();
  }

  void setLoadingFalse() {
    setState(() {
      _isLoading = false;
    });
  }

  void setLoadingTrue() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    headers = List.empty();
    selection = 'All members';
  }

  fetchData() {
    userFromDatabase =
        Provider.of<UserProvider>(context, listen: false).members;
    userFromDatabase.sort((a, b) => a.name.compareTo(b.name));
  }

  List userList = [
    {
      'id': 1,
      'name': 'Muyiwah',
      'unit': "choir",
      'community': 'Community 1',
      'isWorker': 'isWorker',
      'resolution': 'resolved',
      'isLogged': true,
      'phoneNo': '08023456789',
      'whatsappNo': '08023456789',
      'address': 'no 5,olororo street',
      'neaerestBustop': 'Aduloju',
      'group': 'Women',
      'nextOfKin': 'Jumoke Adebunmi',
      'localGovtArea': 'Akinyele',
      'email': 'muyi@gmail.com',
      'annivassary': '3-4-1990',
      'dateOfBirth': '30-9-2020',
    },
  ];
  String editedName = "";
  List<Member> searchedMembersList = [];
  bool notFound = false;
  List<Member> membersList = [];
  List<Member> SortedMembersList = [];
  List<Member> displayMembersList = [];
  Timer? time;
  Timer? debounce;
  // String searchText = '';
  // Data data = Data();
  // search(searchText) {
  //   print(searchText);
  //   if (searchText.isNotEmpty) {
  //     setLoadingTrue();
  //     notFound = false;
  //     searchedMembersList.clear();
  //     for (Member mem in userFromDatabase) {
  //       if (mem.name.toLowerCase().contains(searchText.toLowerCase()) ||
  //           mem.dateOfBirth.toLowerCase().contains(searchText.toLowerCase()) ||
  //           mem.annivassary.toLowerCase().contains(searchText.toLowerCase())) {
  //         print(mem.name);
  //         searchedMembersList.add(mem);
  //         counter = 0;
  //       }
  //     }

  //     timer();
  //     setState(() {});
  //   }
  //   if (searchText.isNotEmpty && searchedMembersList.isEmpty) {
  //     notFound = true;
  //     setState(() {});
  //     //  timer();
  //   }
  // }

  search(searchText) {
    counter = 0;
    if (debounce != null) debounce!.cancel();
    setState(() {
      debounce = Timer(Duration(milliseconds: 500), () {
        if (searchText.isNotEmpty) {
          setLoadingTrue();
          notFound = false;
          searchedMembersList.clear();
          for (Member mem in userFromDatabase) {
            if (mem.name.toLowerCase().contains(searchText.toLowerCase()) ||
                mem.dateOfBirth
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                mem.annivassary
                    .toLowerCase()
                    .contains(searchText.toLowerCase())) {
              print(mem.name);
              searchedMembersList.add(mem);
              counter = 0;
            }
          }

          timer();
          setState(() {});
        }
        if (searchText.isNotEmpty && searchedMembersList.isEmpty) {
          notFound = true;
          setState(() {});
          //  timer();
        }
      });
    });
  }

  List<Member> userFromDatabase = [];

  void timer() {
    time = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setLoadingFalse();
      stopTimer();
    });
  }

  stopTimer() {
    time!.cancel();
  }

  pickCalender(String data) async {
    DateTime? newDate = await showDatePicker(
        helpText: data,
        // showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) return;
    setState(() {
      datetime2 = newDate;
      print(newDate);
      print(newDate.toString().split(" ")[0]);
    });
    if (data == 'Day') {
      search(newDate.toString().split(" ")[0]);
    } else if (data == 'Month') {
      search(
          "${newDate.toString().split(' ')[0].split('-')[0]}-${newDate.toString().split(' ')[0].split('-')[1]}");
    }
  }

  showAnivassaryDialog() {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text('Birtday/Wedding Annivasary'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    pickCalender('Month');
                  },
                  child: Text('This month'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    pickCalender('Day');
                  },
                  child: Text('Day'),
                ),
              ],
            )));
  }

  doSorting(searchText) {
    setLoadingTrue();
    counter = 0;

    if (searchText == 'All members') {
      searchedMembersList.clear();
      for (var element in userFromDatabase) {
        searchedMembersList.add(element);
        print(element.name);
      }
      setState(() {});
      timer();
    } else if (searchText.isNotEmpty) {
      notFound = false;

      searchedMembersList.clear();
      for (Member mem in userFromDatabase) {
        if (mem.community.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.unit.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.isWorker.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.group.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.annivassary.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.dateOfBirth.toLowerCase().contains(searchText.toLowerCase()) ||
            mem.address.toLowerCase().contains(searchText.toLowerCase())) {
          // print(mem.name);
          searchedMembersList.add(mem);
          print(searchedMembersList.length);
          counter = 0;
        }
      }

      timer();
      setState(() {
        createDataSource();
      });
    }
    if (searchText.isNotEmpty && searchedMembersList.isEmpty) {
      notFound = true;
      setState(() {});
    }
  }

  void createDataSource() {
    headers = [
      ExpandableColumn<int>(columnTitle: "ID", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "name", columnFlex: 2),
      ExpandableColumn<String>(columnTitle: "Dept", columnFlex: 2),
      ExpandableColumn<String>(columnTitle: "isActive", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "community", columnFlex: 2),
      ExpandableColumn<String>(columnTitle: "isWorker", columnFlex: 2),
      // ExpandableColumn<String>(columnTitle: "resolution", columnFlex: 1),
      // ExpandableColumn<bool>(columnTitle: "isLogged", columnFlex: 1),
      ExpandableColumn<String>(columnTitle: "phoneNo", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "whatsappNo", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "address", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "neaerestBustop", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "group", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "nextOfKin", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "localGovtArea", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "email", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "annivassary", columnFlex: 4),
      ExpandableColumn<String>(columnTitle: "dateOfBirth", columnFlex: 4),
    ];

    rows = (searchedMembersList.isEmpty && notFound == false)
        ? userFromDatabase.map<ExpandableRow>((e) {
            counter++;
            return ExpandableRow(cells: [
              ExpandableCell<int>(columnTitle: "ID", value: counter),
              ExpandableCell<String>(columnTitle: "name", value: e.name),
              ExpandableCell<String>(columnTitle: "Dept", value: e.unit),
              ExpandableCell<String>(
                  columnTitle: "community", value: e.community),
              ExpandableCell<String>(
                  columnTitle: "isWorker", value: e.isWorker),
              ExpandableCell<String>(columnTitle: "phoneNo", value: e.phoneNo),
              ExpandableCell<String>(
                  columnTitle: "whatsappNo", value: e.whatsappNo),
              ExpandableCell<String>(columnTitle: "address", value: e.address),
              ExpandableCell<String>(
                  columnTitle: "neaerestBustop", value: e.neaerestBustop),
              ExpandableCell<String>(columnTitle: "group", value: e.group),
              ExpandableCell<String>(
                  columnTitle: "nextOfKin", value: e.nextOfKin),
              ExpandableCell<String>(
                  columnTitle: "localGovtArea", value: e.localGovtArea),
              ExpandableCell<String>(columnTitle: "email", value: e.email),
              ExpandableCell<String>(
                  columnTitle: "annivassary", value: e.annivassary),
              ExpandableCell<bool>(columnTitle: "isActive", value: e.isLogged),
              ExpandableCell<String>(
                  columnTitle: "dateOfBirth", value: e.dateOfBirth),
            ]);
          }).toList()
        : (searchedMembersList.isNotEmpty && notFound == false)
            ? searchedMembersList.map<ExpandableRow>((e) {
                counter++;
                return ExpandableRow(cells: [
                  ExpandableCell<int>(columnTitle: "ID", value: counter),
                  ExpandableCell<String>(columnTitle: "name", value: e.name),
                  ExpandableCell<String>(columnTitle: "Dept", value: e.unit),
                  ExpandableCell<String>(
                      columnTitle: "community", value: e.community),
                  ExpandableCell<String>(
                      columnTitle: "isWorker", value: e.isWorker),
                  ExpandableCell<String>(
                      columnTitle: "phoneNo", value: e.phoneNo),
                  ExpandableCell<String>(
                      columnTitle: "whatsappNo", value: e.whatsappNo),
                  ExpandableCell<String>(
                      columnTitle: "address", value: e.address),
                  ExpandableCell<String>(
                      columnTitle: "neaerestBustop", value: e.neaerestBustop),
                  ExpandableCell<String>(columnTitle: "group", value: e.group),
                  ExpandableCell<String>(
                      columnTitle: "nextOfKin", value: e.nextOfKin),
                  ExpandableCell<String>(
                      columnTitle: "localGovtArea", value: e.localGovtArea),
                  ExpandableCell<String>(columnTitle: "email", value: e.email),
                  ExpandableCell<String>(
                      columnTitle: "annivassary", value: e.annivassary),
                  ExpandableCell<bool>(
                      columnTitle: "isActive", value: e.isLogged),
                  ExpandableCell<String>(
                      columnTitle: "dateOfBirth", value: e.dateOfBirth),
                ]);
              }).toList()
            : (searchedMembersList.isEmpty && notFound == true)
                ? userList.map<ExpandableRow>((e) {
                    counter++;
                    return ExpandableRow(cells: [
                      ExpandableCell<int>(
                          columnTitle: 'not found', value: counter),
                      ExpandableCell<String>(
                          columnTitle: "name", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "Dept", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "community", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "isWorker", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "phoneNo", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "whatsappNo", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "address", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "neaerestBustop", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "group", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "nextOfKin", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "localGovtArea", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "email", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "annivassary", value: 'not found'),
                      ExpandableCell<bool>(
                          columnTitle: "isActive", value: false),
                      ExpandableCell<String>(
                          columnTitle: "dateOfBirth", value: 'not found'),
                    ]);
                  }).toList()
                : userList.map<ExpandableRow>((e) {
                    counter++;
                    return ExpandableRow(cells: [
                      ExpandableCell<int>(
                          columnTitle: 'not found', value: counter),
                      ExpandableCell<String>(
                          columnTitle: "name", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "Dept", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "community", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "isWorker", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "phoneNo", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "whatsappNo", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "address", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "neaerestBustop", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "group", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "nextOfKin", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "localGovtArea", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "email", value: 'not found'),
                      ExpandableCell<String>(
                          columnTitle: "annivassary", value: 'not found'),
                      ExpandableCell<bool>(
                          columnTitle: "isActive", value: false),
                      ExpandableCell<String>(
                          columnTitle: "dateOfBirth", value: 'not found'),
                    ]);
                  }).toList();
  }

  @override
  Widget build(BuildContext context) {
    createDataSource();
    print(_isLoading);
    print(searchedMembersList.length);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter = 0;
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewMember()));
        },
        child: Text('New'),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                showAnivassaryDialog();
              },
              child: Icon(
                Icons.calendar_month,
                color: Colors.blue,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  height: 80,
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
                          color: Colors.black,
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
          !_isLoading
              ? Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    int visibleCount = 3;
                    if (constraints.maxWidth < 600) {
                      visibleCount = 4;
                    } else if (constraints.maxWidth < 800) {
                      visibleCount = 4;
                    } else if (constraints.maxWidth < 1000) {
                      visibleCount = 5;
                    } else {
                      visibleCount = 6;
                    }

                    return ExpandableTheme(
                      data: ExpandableThemeData(
                        context,
                        contentPadding: const EdgeInsets.all(20),
                        expandedBorderColor: Colors.blue,
                        paginationSize: 28,
                        headerHeight: 56,
                        headerColor: Colors.amber[400],
                        headerBorder: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        evenRowColor: const Color(0xFFFFFFFF),
                        oddRowColor: const Color(0xFFFFFFFF),
                        rowBorder: const BorderSide(
                          color: Colors.black,
                          width: 0.3,
                        ),
                        rowColor: Colors.green,
                        headerTextMaxLines: 4,
                        headerSortIconColor: const Color(0xFF6c59cf),
                        paginationSelectedFillColor: const Color(0xFF6c59cf),
                        paginationSelectedTextColor: Colors.white,
                      ),
                      child: ExpandableDataTable(
                        headers: headers,
                        rows: rows,
                        multipleExpansion: true,
                        isEditable: true,
                        onRowChanged: (newRow) {
                          print(newRow.cells[3].value);
                        },
                        onPageChanged: (page) {
                          print(page);
                        },
                        renderEditDialog: (row, onSuccess) =>
                            _buildEditDialog(row, onSuccess),
                        visibleColumnCount: visibleCount,
                      ),
                    );
                  }),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      )),
    );
  }

  // Widget _buildEditDialog(
  //     ExpandableRow row, Function(ExpandableRow) onSuccess) {
  //   return AlertDialog(
  //     title: SizedBox(
  //       height: 300,
  //       child: TextButton(
  //         child: const Text("Change name"),
  //         onPressed: () {
  //           row.cells[1].value = "x3";
  //           onSuccess(row);
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget _buildEditDialog(
      ExpandableRow row, Function(ExpandableRow) onSuccess) {
    return AlertDialog(
      title: Text('Edit  ${row.cells[1].value} data'),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () async {
              Navigator.pop(context);
              setLoadingTrue();
              counter = 0;
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DataEntry(userFromDatabase[
                          userFromDatabase.indexWhere((element) =>
                              element.name == row.cells[1].value)])));
              setLoadingFalse();
            },
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            )),
      ],
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
              fontSize: Responsive.isTablet(context) ? 24 : 15,
              color: Colors.black,
              fontWeight: FontWeight.w600),
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
