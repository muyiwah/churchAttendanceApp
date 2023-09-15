import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:mivattendance/screens/socials.dart';
import 'package:provider/provider.dart';

String selection = 'None';
String selectionForCommunity = 'None';
String group = 'None';
String isWorker = 'Not Worker';
String communityUnitgroupLeading = 'None';

class DataEntry extends StatefulWidget {
  DataEntry(this.userFromDatabase, {super.key});
  Member userFromDatabase;

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  bool buildAgain = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (buildAgain) {
      _name = TextEditingController(text: widget.userFromDatabase.name);
      _unit = TextEditingController(text: widget.userFromDatabase.unit);
      _community =
          TextEditingController(text: widget.userFromDatabase.community);
      _isWorker = TextEditingController(text: widget.userFromDatabase.isWorker);
      _phoneNo = TextEditingController(text: widget.userFromDatabase.phoneNo);
      _whatsappNo =
          TextEditingController(text: widget.userFromDatabase.whatsappNo);
      _address = TextEditingController(text: widget.userFromDatabase.address);
      _nearestBusStop =
          TextEditingController(text: widget.userFromDatabase.neaerestBustop);
      _group = TextEditingController(text: widget.userFromDatabase.group);
      _nextOfKin =
          TextEditingController(text: widget.userFromDatabase.nextOfKin);
      _localGovtArea =
          TextEditingController(text: widget.userFromDatabase.localGovtArea);
      _localGovtArea =
          TextEditingController(text: widget.userFromDatabase.localGovtArea);
      _email = TextEditingController(text: widget.userFromDatabase.email);
      _annivassary =
          TextEditingController(text: widget.userFromDatabase.annivassary);
      _dateOfBirth =
          TextEditingController(text: widget.userFromDatabase.dateOfBirth);
      _communityUnitLeading = TextEditingController(
          text: widget.userFromDatabase.communityUnitLeading);
      buildAgain = false;
    }
  }

  late TextEditingController _name;

  late TextEditingController _unit;

  late TextEditingController _community;

  late TextEditingController _isWorker;

  late TextEditingController _phoneNo;

  late TextEditingController _whatsappNo;

  late TextEditingController _address;

  late TextEditingController _nearestBusStop;

  late TextEditingController _group;

  late TextEditingController _nextOfKin;

  late TextEditingController _localGovtArea;

  late TextEditingController _email;

  late TextEditingController _annivassary;

  late TextEditingController _dateOfBirth;
  late TextEditingController _communityUnitLeading;

  delete() {
    Provider.of<UserProvider>(context, listen: false)
        .deleteMember(widget.userFromDatabase);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('successfully deleted member')));
    Navigator.pop(context);
  }

  update() {
    Provider.of<UserProvider>(context, listen: false).updateMemberDetail(Member(
        name: _name.text,
        phoneNo: _phoneNo.text,
        whatsappNo: _whatsappNo.text,
        address: _address.text,
        neaerestBustop: _nearestBusStop.text,
        group: group,
        nextOfKin: _nextOfKin.text,
        localGovtArea: _localGovtArea.text,
        email: _email.text,
        unit: _unit.text,
        isLogged: false,
        isWorker: _isWorker.text,
        dateOfBirth: _dateOfBirth.text,
        annivassary: _annivassary.text));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('successfully updated member')));
    Navigator.pop(context);
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
    if (data == 'DOB') {
      _dateOfBirth.text = newDate.toString().split(" ")[0];
    } else if (data == 'annivassary') {
      _annivassary.text = newDate.toString().split(" ")[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userFromDatabase.name),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              customText(
                  name: _name,
                  label: 'Name',
                  hint: 'name',
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: CustopDropForDept(
                        sortMembers: (data) {
                          data;
                          _unit.text = selection;
                          setState(() {
                            print(data);
                          });
                        },
                      )),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: _unit,
                    decoration: InputDecoration(
                        hintText: 'unit',
                        labelText: 'unit',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: CustopDropForCommunity(
                        sortMembers: (data) {
                          data;
                          _community.text = selectionForCommunity;
                          setState(() {});
                        },
                      )),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    // initialValue: selectionForCommunity,
                    controller: _community,
                    decoration: InputDecoration(
                        hintText: 'community',
                        labelText: 'community',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: IsWorker(
                        sortMembers: (data) {
                          data;
                          _isWorker.text = isWorker;
                          setState(() {});
                        },
                      )),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    // initialValue: selectionForCommunity,
                    controller: _isWorker,
                    decoration: const InputDecoration(
                        hintText: 'Is worker',
                        labelText: 'Is Worker',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _phoneNo,
                  label: 'Phone no',
                  hint: 'Phone no',
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _whatsappNo,
                  label: 'Whatsapp no',
                  hint: 'Whatsapp no',
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _address,
                  label: 'Address',
                  hint: 'Address',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _nearestBusStop,
                  label: 'Nearest Buststop',
                  hint: 'Nearest Buststop',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: Group(
                        sortMembers: (data) {
                          data;
                          _group.text = group;
                          setState(() {});
                        },
                      )),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: _group,
                    decoration: InputDecoration(
                        hintText: 'Group',
                        labelText: 'Group',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: CommunityUnitLeading(
                        sortMembers: (data) {
                          data;
                          _communityUnitLeading.text =
                              communityUnitgroupLeading;
                          setState(() {});
                        },
                      )),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: _communityUnitLeading,
                    decoration: InputDecoration(
                        hintText: 'Community/Unit leading',
                        labelText: 'Community/Unit leading',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: InkWell(
                          onTap: () {
                            pickCalender('DOB');
                          },
                          child: Icon(Icons.calendar_month))),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: _dateOfBirth,
                    decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: Responsive.isTablet(context) ? 200 : 100,
                      child: InkWell(
                          onTap: () {
                            pickCalender('annivassary');
                          },
                          child: Icon(Icons.calendar_month))),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: _annivassary,
                    decoration: InputDecoration(
                        hintText: 'Wedding Annivassary',
                        labelText: 'Wedding Annivassary',
                        border: OutlineInputBorder()),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _nextOfKin,
                  label: 'Next of Kin',
                  hint: 'Next of Kin',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _localGovtArea,
                  label: 'Local Govt Area',
                  hint: 'Local Govt Area',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              customText(
                  name: _email,
                  label: 'Email',
                  hint: 'Email',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: update,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(100, 50)),
                      child: Text(
                        'Update Database',
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: delete,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(100, 50)),
                      child: Text(
                        'Delete Member',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customText extends StatelessWidget {
  customText({
    super.key,
    required this.keyboardType,
    required TextEditingController name,
    required this.label,
    required this.hint,
  }) : _name = name;

  final TextEditingController _name;
  final String label;
  final String hint;
  final keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: _name,
      decoration: InputDecoration(
          hintText: hint, labelText: label, border: OutlineInputBorder()),
    );
  }
}

class CustopDropForDept extends StatefulWidget {
  CustopDropForDept({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<CustopDropForDept> createState() => _CustopDropForDeptState();
}

class _CustopDropForDeptState extends State<CustopDropForDept> {
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
                value: 'None',
                child: Text(
                  'None',
                  style: TextStyle(color: Colors.blue),
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
            // DropdownMenuItem(value: 'Community 1', child: Text('community 1')),
            // DropdownMenuItem(value: 'Community 2', child: Text('community 2')),
            // DropdownMenuItem(value: 'Community 3', child: Text('community 3')),
            // DropdownMenuItem(value: 'Community 4', child: Text('community 4')),
            // DropdownMenuItem(value: 'Community 5', child: Text('community 5')),
            // DropdownMenuItem(value: 'Community 6', child: Text('community 6')),
            // DropdownMenuItem(value: 'Community 7', child: Text('community 7')),
            // DropdownMenuItem(value: 'Community 8', child: Text('community 8')),
            // DropdownMenuItem(value: 'Community 9', child: Text('community 9')),
            // DropdownMenuItem(
            //     value: 'Community 10', child: Text('community 10')),
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

class CustopDropForCommunity extends StatefulWidget {
  CustopDropForCommunity({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<CustopDropForCommunity> createState() => _CustopDropForCommunityState();
}

class _CustopDropForCommunityState extends State<CustopDropForCommunity> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              fontSize: Responsive.isTablet(context) ? 24 : 15,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          value: selectionForCommunity,
          items: const [
            DropdownMenuItem(
                value: 'None',
                child: Text(
                  'None',
                  style: TextStyle(color: Colors.blue),
                )),

            // DropdownMenuItem(value: 'media', child: Text('media')),
            // DropdownMenuItem(value: 'choir', child: Text('choir')),
            // DropdownMenuItem(value: 'ushering', child: Text('ushering')),
            // DropdownMenuItem(value: 'prayer', child: Text('prayer')),
            // DropdownMenuItem(value: 'protocol', child: Text('protocol')),
            // DropdownMenuItem(value: 'children', child: Text('children')),
            // DropdownMenuItem(value: 'sanctuary', child: Text('sanctuary')),
            // DropdownMenuItem(value: 'technical', child: Text('technical')),
            // DropdownMenuItem(value: 'security', child: Text('security')),
            // DropdownMenuItem(value: 'integration', child: Text('integration')),
            // DropdownMenuItem(value: 'greeters', child: Text('greeters')),
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
            selectionForCommunity = value!;
            setState(() {
              widget.sortMembers(selectionForCommunity);
            });
          }),
    );
  }
}

class Group extends StatefulWidget {
  Group({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              fontSize: Responsive.isTablet(context) ? 24 : 15,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          value: group,
          items: const [
            DropdownMenuItem(
                value: 'None',
                child: Text(
                  'None',
                  style: TextStyle(color: Colors.blue),
                )),
            DropdownMenuItem(value: 'Women', child: Text('Women')),
            DropdownMenuItem(value: 'Men', child: Text('Men')),
            DropdownMenuItem(value: 'Youth', child: Text('Youth')),
            DropdownMenuItem(value: 'Teenage', child: Text('Teenage')),
            DropdownMenuItem(value: 'Children', child: Text('Children')),
          ],
          onChanged: (value) {
            group = value!;
            setState(() {
              widget.sortMembers(group);
            });
          }),
    );
  }
}

class IsWorker extends StatefulWidget {
  IsWorker({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<IsWorker> createState() => _IsWorkerState();
}

class _IsWorkerState extends State<IsWorker> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              fontSize: Responsive.isTablet(context) ? 24 : 15,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          value: isWorker,
          items: const [
            DropdownMenuItem(
                value: 'Not Worker',
                child: Text(
                  'Not a Worker',
                  style: TextStyle(color: Colors.black),
                )),
            DropdownMenuItem(value: 'Is Worker', child: Text('Is Worker')),
          ],
          onChanged: (value) {
            isWorker = value!;
            setState(() {
              widget.sortMembers(isWorker);
            });
          }),
    );
  }
}

class CommunityUnitLeading extends StatefulWidget {
  CommunityUnitLeading({super.key, required this.sortMembers});
  Function sortMembers;
  @override
  State<CommunityUnitLeading> createState() => _CommunityUnitLeadingState();
}

class _CommunityUnitLeadingState extends State<CommunityUnitLeading> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButton(
          isExpanded: true,
          style: TextStyle(
              fontSize: Responsive.isTablet(context) ? 24 : 15,
              color: Colors.black,
              fontWeight: FontWeight.w600),
          value: communityUnitgroupLeading,
          items: const [
            DropdownMenuItem(
                value: 'None',
                child: Text(
                  'None',
                  style: TextStyle(color: Colors.blue),
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
            communityUnitgroupLeading = value!;
            setState(() {
              widget.sortMembers(communityUnitgroupLeading);
            });
          }),
    );
  }
}
