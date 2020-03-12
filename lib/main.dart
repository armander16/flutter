import 'package:directorio_ams/pages/detallePage.dart';
import 'package:directorio_ams/pages/userPage.dart';
import 'package:directorio_ams/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new HomeApp(),
  );
}

/*
// Wrap main widget inside the StreamProvider
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityResult>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tutorials',
        home: new ConnectivityDemo(),
      ),
    );
  }
}
*/

/*
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorials',
      home: new RSSDemo(),
    );
  }
}
*/

class HomeApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorio AMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
     // home: UserFilterDemo(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){

        print( 'Ruta llamda: ${ settings.name }' );

        return MaterialPageRoute(
          builder: ( BuildContext context ) => DetallePage()
        );


      },
    );
  }
}