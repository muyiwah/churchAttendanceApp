import 'package:flutter/material.dart';
import 'package:mivattendance/models/members.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetailScreen extends StatelessWidget {
  MemberDetailScreen(this.displayMembersList, {super.key});
  Member displayMembersList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Member Information'),
        ),
        body: SingleChildScrollView(
          child: Responsive.isTablet(context)
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      if (!displayMembersList.isLogged)
                        Text(
                          displayMembersList.resolution == 'unResolved'
                              ? 'Absent and Unresolved'
                              : 'Absent and resolveddfghshsfgh',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  displayMembersList.resolution == 'unResolved'
                                      ? Colors.red
                                      : Colors.green,
                              fontSize: 25),
                        ),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const CircleAvatar(
                                    radius: 120,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          displayMembersList.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          'oyo state ',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          'place of work',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          displayMembersList.phoneNo,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          displayMembersList.address,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
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
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        vertical:
                                            BorderSide(color: Colors.grey))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      displayMembersList.community,
                                      style: const TextStyle(fontSize: 20),
                                    ),

                                    // Text(
                                    //  displayMembersList.community,
                                    //   style: TextStyle(
                                    //       fontSize: 20),
                                    // ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      displayMembersList.unit,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      )),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (!displayMembersList.isLogged)
                              const Text(
                                'Reason why absent',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            if (!displayMembersList.isLogged)
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                height: 150,
                                color: Colors.grey.withOpacity(.3),
                                child: Text(
                                  displayMembersList.reasonAbsent,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Community',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      displayMembersList.community,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Community Leader',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      'community leader name',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'community phone no',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'call community leader',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Department',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      displayMembersList.unit,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Department leader',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24),
                                    ),
                                    Text(
                                      'department leader name',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'department phone no',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'call department leader',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    if (!displayMembersList.isLogged)
                      Text(
                        (displayMembersList.resolution == 'resolved' ||
                                displayMembersList.dontAskMeAgain == true)
                            ? 'Absent and resolved'
                            : 'Absent and Unresolved',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (displayMembersList.resolution ==
                                        'resolved' ||
                                    displayMembersList.dontAskMeAgain == true)
                                ? Colors.green
                                : Colors.red,
                            fontSize: 25),
                      ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border:
                                      Border.symmetric(vertical: BorderSide())),
                              padding: const EdgeInsets.only(left: 8),
                              width: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      displayMembersList.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      displayMembersList.phoneNo,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    Text(
                                      displayMembersList.address,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),

                                    Text(
                                      displayMembersList.community,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      displayMembersList.unit,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Call',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          displayMembersList.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone_callback,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          displayMembersList.phoneNo,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'tel',
                                    path: "${displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('can not lauch')));
                                }
                              },
                              child: const Text(
                                'Call',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'sms',
                                    path: "${displayMembersList.phoneNo}");
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('can not lauch')));
                                }
                              },
                              child: const Text(
                                'SMS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (!displayMembersList.isLogged)
                      Text(
                        'why is ${displayMembersList.name} absent in church?',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                    const SizedBox(
                      height: 14,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          if (!displayMembersList.isLogged)
                            const Text(
                              'Reason why absent',
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            ),
                          if (!displayMembersList.isLogged)
                            Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: 150,
                              color: Colors.grey.withOpacity(.3),
                              child: Text(
                                displayMembersList.reasonAbsent,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Community',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      displayMembersList.community,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      'leader',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .findLeadingUnitCommunity(
                                              displayMembersList.community),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .findPhoneOfLeadingUnitCommunity(
                                              displayMembersList.community),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .findWhatsappOfLeadingUnitCommunity(
                                              displayMembersList.community),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Department',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      displayMembersList.unit,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      'leader',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Provider.of<UserProvider>(context)
                                              .findLeadingUnitCommunity(
                                                  displayMembersList.unit),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Provider.of<UserProvider>(context)
                                              .findPhoneOfLeadingUnitCommunity(
                                                  displayMembersList.unit),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        // Container(
                                        //     padding: const EdgeInsets.symmetric(
                                        //         vertical: 3, horizontal: 6),
                                        //     margin: const EdgeInsets.symmetric(
                                        //         horizontal: 2),
                                        //     decoration: BoxDecoration(
                                        //         color: Colors.green,
                                        //         borderRadius:
                                        //             BorderRadius.circular(5)),
                                        //     child: InkWell(
                                        //       onTap: () async {
                                        //         final Uri uri = Uri(
                                        //             scheme: 'sms',
                                        //             path:
                                        //                 "${displayMembersList.phoneNo}");
                                        //         if (await canLaunchUrl(uri)) {
                                        //           await launchUrl(uri);
                                        //         } else {
                                        //           ScaffoldMessenger.of(context)
                                        //               .showSnackBar(const SnackBar(
                                        //                   content: Text(
                                        //                       'can not lauch')));
                                        //         }
                                        //       },
                                        //       child: const Text(
                                        //         'SMS',
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold,
                                        //             fontSize: 14,
                                        //             color: Colors.white),
                                        //       ),
                                        //     )),
                                      ],
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context)
                                          .findWhatsappOfLeadingUnitCommunity(
                                              displayMembersList.unit),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }
}
