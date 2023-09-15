import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:mivattendance/models/analytics.dart';
import 'package:mivattendance/screens/all_members.dart';
import 'package:mivattendance/screens/analytics.dart';
import 'package:mivattendance/screens/data_entry.dart';
import 'package:mivattendance/screens/department_screen.dart';
import 'package:mivattendance/screens/dept_unresolved.dart';
import 'package:mivattendance/screens/head_count.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:mivattendance/screens/search_screen.dart';
import 'package:mivattendance/screens/socials.dart';
import 'package:mivattendance/screens/super_admin.dart';
import 'package:mivattendance/screens/admin_check_unresolved.dart';

String selection = 'media';
String selectionCommunity = 'Community 1';
String password = '1234';
String passwordEntered = "";

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  departments(context, role) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(role == 'headCount'
                  ? 'Head Count'
                  : role == 'adminCheckAllUnresoled'
                      ? 'Check all members(unresloved)'
                      : role == 'adminCheckUnresoledDepts'
                          ? 'Check all Departments/Communitys(unresloved)'
                          : role == 'communityLeader'
                              ? 'Select Community'
                              : 'Select Dept'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    if (passwordEntered == password && role == 'headCount') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HeadCount()));
                    } else if (passwordEntered == password &&
                        role == 'adminCheckAllUnresoled') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Unresolved()));
                    } else if (passwordEntered == password &&
                        role == 'adminCheckUnresoledDepts') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DepartmentUnresolved()));
                    } //SearchScreen(adminCheckAllUnresoled
                    //   dept: comunity[index]['unit'],fromDepartment:false
                    // )
                    else if (passwordEntered == password &&
                        role == 'communityLeader') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DepartmentScreen(
                                  dept: selectionCommunity,
                                  fromDepartment: false)));
                    } else if (passwordEntered == password) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DepartmentScreen(
                                  dept: selection, fromDepartment: true)));
                    } else {
                     AnimatedSnackBar.rectangle(
                        'Error',
                        'Incorrect passcode',
                        type: AnimatedSnackBarType.error,
                        brightness: Brightness.dark,
                      ).show(
                        context,
                      );
                      ;
                    }
                  },
                  child: Text(
                    'Submit',
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
                        role == 'communityLeader'
                            ? CustomCommunityDrop()
                            : (role != 'admin' &&
                                    role != 'headCount' &&
                                    role != 'adminCheckAllUnresoled' &&
                                    role != 'adminCheckUnresoledDepts')
                                ? CustomDrop()
                                : const SizedBox.shrink(),
                        Container(
                            padding: const EdgeInsets.all(16),
                            height: 90,
                            width: double.infinity,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                              obscureText: true,
                              onChanged: (value) {
                                passwordEntered = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter passcode',
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            )),
                      ],
                    )),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            color: Colors.purpleAccent.withOpacity(.4),
            child: Row(
              children: [],
            ),
          )),
          InkWell(
            onTap: () {
              departments(context, 'admin');
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'All Members',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              departments(context, 'hod');
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'HODs',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              departments(context, 'communityLeader');
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Community Leader',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
         
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: .2),
                borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.all(5),
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  departments(
                    context,
                    'adminCheckAllUnresoled',
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Admin check all unresolved',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: .2),
                borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                departments(
                  context,
                  'adminCheckUnresoledDepts',
                );
              },
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Admin check unresolved depts',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SocialsScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Socials',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SuperAdminScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Super Admin',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('ddf');
              // Navigator.pop(context);
              // // Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Analytics()));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Analytics',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        InkWell(
            onTap: () {
              departments(context, 'headCount');
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .2),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Head Count',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),   InkWell(
              child: Text(
            'Log out',
            style: TextStyle(color: Colors.black),
          ))
        ],
      ),
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
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: const TextStyle(
              fontSize: 24, color: Colors.black, ),
          value: selection,
          items: const [
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
          ],
          onChanged: (value) {
            selection = value!;
            setState(() {
              print(selection);
            });
          }),
    );
  }
}

class CustomCommunityDrop extends StatefulWidget {
  CustomCommunityDrop({super.key});

  @override
  State<CustomCommunityDrop> createState() => _CustomCommunityDropState();
}

class _CustomCommunityDropState extends State<CustomCommunityDrop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: const TextStyle(
              fontSize: 24, color: Colors.black, ),
          value: selectionCommunity,
          items: const [
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
            selectionCommunity = value!;
            setState(() {
              print(selection);
            });
          }),
    );
  }
}
