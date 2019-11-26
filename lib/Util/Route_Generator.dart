import 'package:flutter/material.dart';
import 'package:test_wai_kuai/main.dart';



/**
 * This class is contains all the logic of the page routing
 * each route is one screen
 */
class RouteGenerator {

  /**
   * The settings paratmeter is the input that contains 3 variables
   * The first variable: name(String)     the name of the route
   * The second variable: initialRoute(bool)       whether the screen is the initial screen
   * the last variable: argument(Object)  argument is of object type, can be string of anything, store the data
   * that we wanna pass into the forwarding screen
   */
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments; // the argument of the input

    switch (settings
        .name) // settings.name is the name of the route and of string type
        {
      case '/': // Going to Chose role page
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
//      case '/companyLogin':    // Going to companyLogin page
//        return MaterialPageRoute(builder: (context) => CompanyLogin());
//        break;
//      case '/companyLogin_DATA':  // Going to company login page with some passing data
//        return MaterialPageRoute(builder: (context) => CompanyLogin(testingDataFromPrevious: args));
//        break;
//      case '/userLogin':    // Going to companyLogin page
//        return MaterialPageRoute(builder: (context) => userLogin());
//        break;
//      case '/companySignUp':    // Going to companyLogin page
//        return MaterialPageRoute(builder: (context) => CompanySignUp());
//        break;
//      case '/phoneSignUp':    // Going to companyLogin page
//        return MaterialPageRoute(builder: (context) => PhoneSignUp());
//        break;
//      case '/ListorCards':    // Going to companyLogin page
//        return MaterialPageRoute(builder: (context) => ListorCards());
//        break;

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text('error'),
          ),
          body: Center(
            child: Text('ERROR'),
          )
      );
    }
    );
  }
}