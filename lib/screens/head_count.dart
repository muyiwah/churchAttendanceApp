import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class HeadCount extends StatefulWidget {
  HeadCount({super.key});

  @override
  State<HeadCount> createState() => _HeadCountState();
}

class _HeadCountState extends State<HeadCount> {
  DateTime today = DateTime.now();
  int total = 0;
  int men = 0;
  int women = 0;
  int teens = 0;
  int children = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Head Count today ${today.toString().split(" ")[0]}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Men',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(
                        onChanged: (value) {
                          men = int.parse(value);
                          total = women + men + teens + children;
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              Row(
                children: [
                  CircleAvatar(),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Women',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(
                        onChanged: (value) {
                          women = int.parse(value);
                          total = women + men + teens + children;

                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              Row(
                children: [
                  CircleAvatar(),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Teens',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(
                        onChanged: (value) {
                          teens = int.parse(value);
                          total = women + men + teens + children;

                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              Row(
                children: [
                  CircleAvatar(),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Children',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: TextField(
                        onChanged: (value) {
                          children = int.parse(value);
                          total = women + men + teens + children;

                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 35),
                    ),
                    Text(
                      total.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    )
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     Text(
              //       'Remarks',
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 25,
              //           color: Colors.grey),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(16),
              //         color: Colors.grey.withOpacity(.3),
              //       ),
              //       // margin: EdgeInsets.all(20),
              //       padding: EdgeInsets.all(20),
              //       width: double.infinity,
              //       height: 250,
              //       child: TextField(
              //         decoration: InputDecoration(border: InputBorder.none),
              //       ),
              //     ),
              //   ],
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(280, 50), backgroundColor: Colors.blue),
                onPressed: () {
                  if (1 == 1) {
                    AnimatedSnackBar.rectangle(
                      'Success',
                      'Submitted successfully',
                      type: AnimatedSnackBarType.success,
                      brightness: Brightness.dark,
                    ).show(
                      context,
                    );
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
