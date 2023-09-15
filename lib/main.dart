import 'package:flutter/material.dart';
import 'package:mivattendance/providers/user_provider.dart';
import 'package:mivattendance/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MivHomePage(),
      // home: NavScreen(),
      builder: ((context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: MediaQuery.of(context).size.width > 450 ? 1 : .8),
            child: child!);
      }),
    );
  }
}
