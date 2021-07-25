import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:live/data.dart';
//import 'package:live/provider/companyInfoProvider.dart';
//import 'package:live/screens/infoPage/infoPage.dart';
//import 'package:provider/provider.dart';
import 'package:live/screens/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '@live',
      home: Scaffold(
        body: Wrapper(),
      ),
    );
  }
}

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '@live',
//       home: Scaffold(
//         body: ChangeNotifierProvider<CompanyInfoProvider>(
//           create: (context) => CompanyInfoProvider(),
//           child: DemoPage(),
//         ),
//       ),
//     );
//   }
// }

// class DemoPage extends StatelessWidget {
//   const DemoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CompanyInfoProvider>(
//       builder: (context, provider, child) {
//         return Container(
//           child: TextButton(
//             child: Text("click me"),
//             onPressed: () {
//               provider.setSelectedCompanyName = companies[0]['brandName'];
//               provider.setSelectedCompanyProjectList = companies[0]['project'];
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (contenxt) => Scaffold(
//                     body: ChangeNotifierProvider<CompanyInfoProvider>(
//                       create: (context) => CompanyInfoProvider(),
//                       child: InfoPage(
//                           Provider.of<CompanyInfoProvider>(context)
//                               .selectedCompany!,
//                           Provider.of<CompanyInfoProvider>(context)
//                               .companyProjectList!),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
