import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckResolveMember extends StatefulWidget {
  CheckResolveMember(this.displayMembersList, {super.key});
  final Member displayMembersList;

  @override
  State<CheckResolveMember> createState() => _CheckResolveMemberState();
}

class _CheckResolveMemberState extends State<CheckResolveMember> {
  bool showSubmitButton = false;

  String memberAbsentReason = "";
  String shadowdisplay = "";
  resolve() {
    Provider.of<UserProvider>(context, listen: false)
        .whyMemberIsAbsent(widget.displayMembersList.name, memberAbsentReason);
  }

  bool dontAskMeAgain = false;
  @override
  Widget build(BuildContext context) {
    dontAskMeAgain = widget.displayMembersList.dontAskMeAgain;
    TextEditingController _controller =
        TextEditingController(text: widget.displayMembersList.reasonAbsent);
    shadowdisplay = _controller.text;
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Information'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: Responsive.isTablet(context)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Text(widget.displayMembersList.isLogged.toString()),
                    if (!widget.displayMembersList.isLogged)
                      Text(
                        widget.displayMembersList.resolution == 'unResolved'
                            ? 'Absent and Unresolved'
                            : 'Absent and resolvedkikhkh',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.displayMembersList.resolution ==
                                    'unResolved'
                                ? Colors.red
                                : Colors.green,
                            fontSize: 25),
                      ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 120,
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.displayMembersList.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        widget.displayMembersList.phoneNo,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        widget.displayMembersList.address,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'discipline',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      vertical:
                                          BorderSide(color: Colors.grey))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.displayMembersList.community,
                                    style: TextStyle(fontSize: 20),
                                  ),

                                  // Text(
                                  //  displayMembersList.community,
                                  //   style: TextStyle(
                                  //       fontSize: 20),
                                  // ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    widget.displayMembersList.unit,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    // Expanded(
                    //     child: Column(
                    //   children: [
                    //     Text(
                    //       'Reason why absent',
                    //       style: TextStyle(fontSize: 20, color: Colors.red),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.all(20),
                    //       padding: EdgeInsets.all(20),
                    //       width: double.infinity,
                    //       height: 200,
                    //       color: Colors.grey.withOpacity(.3),
                    //       child: Text(
                    //         'The Member was absent in church today because he travelled to school last week as the school just resumed,',
                    //         style: TextStyle(color: Colors.black, fontSize: 18),
                    //       ),
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Community',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w700, fontSize: 24),
                    //             ),
                    //             Text(
                    //               displayMembersList.community,
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Community Leader',
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 24,
                    //               ),
                    //             ),
                    //             Text(
                    //               'community leader name',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //             Text(
                    //               'community phone no',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //             Text(
                    //               'call community leader',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Department',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w700, fontSize: 24),
                    //             ),
                    //             Text(
                    //               displayMembersList.unit,
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Department leader',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w700, fontSize: 24),
                    //             ),
                    //             Text(
                    //               'department leader name',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //             Text(
                    //               'department phone no',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //             Text(
                    //               'call department leader',
                    //               style: TextStyle(fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ))
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Call',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.displayMembersList.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_callback,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.displayMembersList.phoneNo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'tel',
                                    path:
                                        "${widget.displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('can not lauch')));
                                }
                              },
                              child: Text(
                                'Call',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'sms',
                                    path:
                                        "${widget.displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('can not lauch')));
                                }
                              },
                              child: Text(
                                'SMS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (!widget.displayMembersList.isLogged)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'why is ${widget.displayMembersList.name} absent in church?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                         Checkbox(
                            value: dontAskMeAgain,
                            onChanged: (data) {
                              if (memberAbsentReason.isNotEmpty) {
                                dontAskMeAgain = !dontAskMeAgain;
                                print(dontAskMeAgain);
                                if (!dontAskMeAgain) {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .markAsRemindMe(
                                          widget.displayMembersList.name);
                                  setState(() {});
                                } else if (dontAskMeAgain) {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .markAsDoNotRemindMe(
                                          widget.displayMembersList.name);
                                  setState(() {});
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Pls, give a reason why you are choosing this option in the box below and try again')));
                              }
                            }),
                        Text(
                          "Don't ask me about ${widget.displayMembersList.name} for now?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (!widget.displayMembersList.isLogged)
                      Container(
                          // margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            initialValue: shadowdisplay,
                            onChanged: (value) {
                              memberAbsentReason = value;
                              showSubmitButton = true;
                              setState(() {});
                            },
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                    if (showSubmitButton)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(200, 60),
                              backgroundColor: Colors.blue),
                          onPressed: () {
                          if (memberAbsentReason.isNotEmpty) {
                            resolve();
                            showSubmitButton = false;
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('No reason given yet')));
                          }
                        },
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ))
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    if (!widget.displayMembersList.isLogged)
                      Text(
                        widget.displayMembersList.resolution == 'unResolved'
                            ? 'Absent and Unresolved'
                            : 'Absent and resolved',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.displayMembersList.resolution ==
                                    'unResolved'
                                ? Colors.red
                                : Colors.green,
                            fontSize: 25),
                      ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.symmetric(vertical: BorderSide())),
                              padding: EdgeInsets.only(left: 8),
                              width: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.displayMembersList.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      widget.displayMembersList.phoneNo,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      widget.displayMembersList.address,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),

                                    Text(
                                      widget.displayMembersList.community,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      widget.displayMembersList.unit,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.displayMembersList.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_callback,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.displayMembersList.phoneNo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                               onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'tel',
                                    path:
                                        "${widget.displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('can not lauch')));
                                }
                              }, child: Text(
                                'Call',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'sms',
                                    path:
                                        "${widget.displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('can not lauch')));
                                }
                              },
                              child: Text(
                                'SMS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (!widget.displayMembersList.isLogged)
                      Text(
                        'why is ${widget.displayMembersList.name} absent in church?',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (!widget.displayMembersList.isLogged)
                      Row(
                        children: [
                          Checkbox(
                              value: dontAskMeAgain,
                              onChanged: (data) {
                                if (memberAbsentReason.isNotEmpty) {
                                  dontAskMeAgain = !dontAskMeAgain;
                                  print(dontAskMeAgain);
                                  if (!dontAskMeAgain) {
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .markAsRemindMe(
                                            widget.displayMembersList.name);
                                    setState(() {});
                                  } else if (dontAskMeAgain) {
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .markAsDoNotRemindMe(
                                            widget.displayMembersList.name);
                                    setState(() {});
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Pls, give a reason why you are choosing this option in the box below and try again')));
                                }
                              }),
                          Flexible(
                            child: Text(
                              "Don't ask me about ${widget.displayMembersList.name} for now?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (!widget.displayMembersList.isLogged)
                      Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            initialValue: shadowdisplay,
                            onChanged: (value) {
                              memberAbsentReason = value;
                              showSubmitButton = true;
                              setState(() {});
                            },
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                    if (showSubmitButton)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 50),
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          if (memberAbsentReason.isNotEmpty) {
                            resolve();
                            showSubmitButton = false;
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('No reason given yet')));
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 22, color: Colors.black),
                        ),
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
