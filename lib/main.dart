// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lesson_flutter_intern/GetX/DieuHuong/Screen1.dart';
// import 'package:lesson_flutter_intern/GetX/DieuHuong/Screen2.dart';
// import 'package:lesson_flutter_intern/Navigator_Routing/Navigator/WidgetScreen1.dart';
// import 'package:lesson_flutter_intern/Navigator_Routing/Navigator/WidgetScreen2.dart';
//
// // Phần này áp dụng với provider
// // void main() {
// //   runApp(
// //     ChangeNotifierProvider(
// //       create: (context) => Counter(),
// //       child: MyApp(),
// //     ),
// //   );
// // }
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Phần này áp dụng với getx điều hướng
//       //  return GetMaterialApp(
//       // initialRoute: '/screen1',
//       // getPages: [
//       //   GetPage(name: '/screen1', page: () => Screen1()),
//       //   GetPage(name: '/screen2', page: () => Screen2()),
//       //],
//       // ------------- //
//       // Phần này áp dụng với Navigator
//       // initialRoute: '/',
//       // routes: {
//       //   '/': (context) => Widgetscreen1(),
//       //   '/screen2': (context) => Widgetscreen2(),
//       // },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Widgetscreen1(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// //Phần này dùng để điều hướng màn hình bằng router
// import 'package:flutter/material.dart';
// import 'package:lesson_flutter_intern/Navigator_Routing/Router/MyRouteInformationParser.dart';
// import 'package:lesson_flutter_intern/Navigator_Routing/Router/MyRouterDelegate.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final MyRouterDelegate _routerDelegate = MyRouterDelegate();
//   final MyRouteInformationParser _routeInformationParser =
//       MyRouteInformationParser();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _routerDelegate,
//       routeInformationParser: _routeInformationParser,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:lesson_flutter_intern/Animation/DemoNanoty/Login/login_page.dart';
// import 'package:lesson_flutter_intern/Animation/DemoNanoty/Splash/splash_page.dart';
// import 'package:lesson_flutter_intern/Animation/DemoNanoty/demo.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedOpacity Example'),
        ),
        body: Center(
          child: ImageFadeIn(),
        ),
      ),
    );
  }
}

class ImageFadeIn extends StatefulWidget {
  @override
  _ImageFadeInState createState() => _ImageFadeInState();
}

class _ImageFadeInState extends State<ImageFadeIn> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Bắt đầu hiệu ứng fade in sau khi hình ảnh đã tải xong
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(seconds: 3),
            child: Image.asset(
              'assets/images/img.png',
              width: 270,
              height: 270,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(seconds: 3),
            child: Image.asset(
              'assets/images/11.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
