import 'dart:ui';

import 'package:directorio_ams/modal/User.dart';
import 'package:directorio_ams/providers/Services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
 
class UserFilterDemo extends StatefulWidget {
  UserFilterDemo() : super();
  final String title = "Directorio AMS";
  @override
  UserFilterDemoState createState() => UserFilterDemoState();
}
 
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
  Debouncer({this.milliseconds});
 
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
 
class UserFilterDemoState extends State<UserFilterDemo> with SingleTickerProviderStateMixin{
   final List<Tab> myTabs = <Tab>[
    Tab(text: 'Todos',  icon:  Icon(Icons.account_circle) ),
    Tab(text: 'AMS',    icon:  Icon(Icons.settings_applications)),
    Tab(text: 'AppDev', icon:  Icon(Icons.computer)),
    Tab(text: 'Apps',   icon:  Icon(Icons.apps)),

  ];
  // https://jsonplaceholder.typicode.com/users
  TabController _tabController;
  final _debouncer =  Debouncer(milliseconds: 500);
  final _debouncera = Debouncer(milliseconds: 500);
  final _debouncerd = Debouncer(milliseconds: 500);
  final _debouncerapp = Debouncer(milliseconds: 500);

  List<User>  users = List();
  List<User>  filteredUsers = List();
  List<User>  usersa = List();
  List<User>  filteredUsersa = List();
  List<User>  usersd = List();
  List<User>  filteredUsersd = List();
  List<User>  filteredUsersapp = List();
  List<User>  ams=List();
  List<User>  appdev=List();
  List<User>  datos=List();
  List<User>  datosa=List();
  List<User>  datosd=List();
  List<User>  datosapp=List();
  List<User>  apps=List();
  List<User>  usersapp = List();

  var color_logo = [ Color.fromRGBO(25, 25, 25, 0.5) , Color.fromRGBO(100, 78, 78, 1) , Colors.red,  Colors.yellow, Colors.green, Colors.pink, Colors.red, Colors.brown, Colors.purple, Colors.orange,
                     Colors.white, Colors.blue, Colors.red,  Colors.yellow, Colors.green, Colors.pink, Colors.red, Colors.brown, Colors.purple, Colors.orange,
                     Colors.white, Colors.blue, Colors.red,  Colors.yellow, Colors.green, Color.fromRGBO(0, 0, 0, .5) ];
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
    Services.getUsers().then((usersFromServer) {
      setState(() {
         for( var i=0 ; i<usersFromServer.length; i++){
           if(usersFromServer[i].practica == 'AMS'){
            print(usersFromServer[i].practica);
             ams.add(usersFromServer[i]);
                if(usersFromServer[i].app != null ){
                  apps.add(usersFromServer[i]);
                }
           } else{
                if(usersFromServer[i].practica == 'AppDev'){
                      print(usersFromServer[i].practica);
                      appdev.add(usersFromServer[i]);
                      print(usersFromServer[i].app);
                      if(usersFromServer[i].app != null ){
                          apps.add(usersFromServer[i]);
                    }
                }
           }
         }
          datos     = usersFromServer;
          datosa    = ams;
          datosd    = appdev;
          users     = datos;
          filteredUsers = users;
          usersa    = datosa;
          filteredUsersa = usersa;
          usersd    = datosd;
          filteredUsersd = usersd;
          datosapp   = apps;
          usersapp   = datosapp;
          filteredUsersapp = usersapp;    
      });
    });
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor:  Color.fromRGBO(12, 67, 54, 1),   //Colors.green[800],
        title: Text(widget.title),
          actions: <Widget>[
          IconButton(
            icon: Icon( Icons.timer ),
            onPressed: () {
              url();
            },
          )
        ],
        bottom: TabBar(
          isScrollable: false,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.green, 
          tabs: myTabs
        //   [
        //   new Tab(
        //      text: 'Todos',
        //     icon: new Icon(Icons.account_circle)),
        //   new Tab(
        //     text: 'AMS',
        //     icon: new Icon(Icons.settings_applications)),
        //   //   icon: new Icon(Icons.chat),
        //   // ),
        //   new Tab(
        //     text: 'AppDev',
        //     icon: new Icon(Icons.computer),
        //   )
        // ]
         ,
        controller: _tabController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),
      body: 
       Stack(
        children: <Widget>[
          _fondoApp(),

         TabBarView(
        controller: _tabController,
        children:
        [
          mostarUsuarios(),
          mostarAMS(),
          mostarDev(),
          mostarAPP()
        ]
        //  myTabs.map((Tab tab) {
        //   print('tabbb');
        //   print(tab);
        //   final String label = tab.text.toLowerCase();
        //   return Center(
        //     child: 
        //     mostarUsuarios()
        //     // Text(
        //     //   'This is the $label tab',
        //     //   style: const TextStyle(fontSize: 36),
        //     // ),
        //   );
        // }).toList(),
      ),

        ],
      ),
             //     mostarUsuarios()
   
        // mostarUsuarios()
    );
  }
   
void url() => launch("https://onesofttek.sharepoint.com/sites/home/SitePages/Menu.aspx");

  Widget _fondoApp(){

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(1, 0.9),
          end: FractionalOffset(0.4, 1),
          colors: [
            Color.fromRGBO(38, 82, 101, 1),
            Color.fromRGBO(62, 95, 77, 1.0)
          ]
        )
      ),
    );


    // final cajaRosa = Transform.rotate(
    //   angle: -pi / 5.0,
    //   child: Container(
    //     height: 360.0,
    //     width: 360.0,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(90.0),
    //       gradient: LinearGradient(
    //         colors: [
    //           Color.fromRGBO(255, 192, 156, 1.0),
    //           Color.fromRGBO(223, 82, 134, 1.0)
    //         ]
    //       )
    //     ),
    //   )
    // );
    
    return Stack(
      children: <Widget>[
        gradiente,
        // Positioned(
        //   top: -100.0,
        //   child: cajaRosa
        // )
      ],
    );

  }

Widget mostarAMS(){ 
     return   Column(
        children: <Widget>[
          TextField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Usuario',
              labelText: 'Filtrar por nombre:',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3) ),

              
            ),
            onChanged: (string) {
              _debouncera.run(() {
                setState(() {
                  print(usersa);
                  
                  filteredUsersa = usersa
                      .where((u) => (  
                              u.name
                              .toLowerCase()
                              .contains(string.toLowerCase())
                              // ||
                          //u.email.toLowerCase().contains(string.toLowerCase())
                          )).toList();
                });
              });
            },
          ),
             
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsersa.length,
              itemBuilder: (BuildContext context, int index) {
                return  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      _listaItems( filteredUsersa[index], context ),
                    );
                
              },
            ),
          ),
        ],
      );
}

Widget mostarDev(){ 
     return   Column(
        children: <Widget>[
          TextField(cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Usuario',
                labelText: 'Filtrar por nombre:',
                labelStyle:TextStyle(color: Colors.white) ,
              hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3) ),

            ),
            onChanged: (string) {
              _debouncerd.run(() {
                setState(() {
                  print(usersd);
                  filteredUsersd = usersd
                      .where((u) => (  
                              u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()))).toList();
                });
              });
            },
          ),
             
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsersd.length,
              itemBuilder: (BuildContext context, int index) {
                return 
                //Card(
                  // child: Padding(
                  //   padding: EdgeInsets.all(10.0),
                   // child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      _listaItems( filteredUsersd[index], context ),
                    );
                 // ),
                //);
              },
            ),
          ),
        ],
      );
}

Widget mostarAPP(){
     return   Column(
        children: <Widget>[
          TextField(cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
            autocorrect: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
             hintText: 'Aplicación',
              labelText: 'Filtrar por nombre de app:',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3) ),

            ),
            onChanged: (string) {
              _debouncerapp.run(() {
                setState(() {
                  print(users);
                  filteredUsersapp = usersapp
                      .where((u) => (  
                              u.app
                              .toLowerCase()
                              .contains(string.toLowerCase()) 
                          )).toList();
                });
              });
            },
          ),
             
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsersapp.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      _listaApps( filteredUsersapp[index], context ),
                    );
                 
              },
            ),
          ),
        ],
      );


}
Widget mostarUsuarios(){
     return   Column(
        children: <Widget>[
          TextField(
            cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Usuario',
              labelText: 'Filtrar por nombre:',
              labelStyle:  TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3) ),
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  print(users);
                  filteredUsers = users
                      .where((u) => (  
                              u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()))).toList();
                });
              });
            },
          ),
             
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      _listaItems( filteredUsers[index], context ),
                    );
                
              },
            ),
          ),
        ],
      );
}



    List<Widget> _listaItems( data, BuildContext context ) {    

      var newString = data.isf.substring(0, 2);
      var index = data.isf.substring(0,1);
      print('color');
      print(index);
      int j;

      j =_color(index);  // color del icono

    final List<Widget> opciones = [];
      // data.forEach( (opt) {
      final widgetTemp =  
      
       ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 95.0, sigmaY: 95.0 ),
          child: 

          ListTile(
        title: Text( data.name, style: TextStyle( color: Colors.white)  ),
        leading:CircleAvatar(
              child: Text( newString ,style: TextStyle( color: Colors.black )), // Color.fromRGBO(1, 255, 1, 0.5) ) ),
              backgroundColor: color_logo[j], // Color.fromRGBO(25, 25, 25, 0.5) ,
            ), // Icon ( Icons.person_outline, color: Colors.white ), //Text( opt['Teléfono'] ), //getIcon( opt['Teléfono'] ) ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Color.fromRGBO(255, 255, 255, 0.5) ),
        onTap: () {
          // final route = MaterialPageRoute(
          //   builder: ( context )=> AlertPage()
          // );
          Navigator.pushNamed(context, 'detalle' , arguments:  data );
          //  Navigator.push(context, route);
        },
      )

      //       ListTile(
      //   title: Text( data.name ),
      //   leading:  Icon ( Icons.person_outline, color: Color.fromRGBO(20, 54, 101, 1.0) ), //Text( opt['Teléfono'] ), //getIcon( opt['Teléfono'] ) ,
      //   trailing: Icon ( Icons.keyboard_arrow_right, color: Color.fromRGBO(20, 54, 101, 1.0)),
      //   onTap: () {
      //     // final route = MaterialPageRoute(
      //     //   builder: ( context )=> AlertPage()
      //     // );
      //     Navigator.pushNamed(context, 'detalle' , arguments:  data );
      //     //  Navigator.push(context, route);
      //   },
      // )
            
          
        
        ),
      );

      opciones..add( widgetTemp )
              ..add(SizedBox(height: 25.0))
              ..add( Divider() );
   // });
    return opciones;
  }

 List<Widget> _listaApps( data, BuildContext context ) {     
    final List<Widget> opciones = [];
      final widgetTemp = 
       ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 95.0, sigmaY: 95.0 ),
          child: 

       ListTile(
        title: Text( data.app,style: TextStyle( color: Colors.white)  ),
        subtitle: Column(
          children: <Widget>[
            Text(data.rol ,style: TextStyle( color: Colors.grey ) ),
            Text(data.name,style: TextStyle( color: Colors.grey) )
          ],
        ),
        leading:  Icon ( Icons.widgets, color: Colors.white ), 
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.white),
        onTap: () {
          Navigator.pushNamed(context, 'detalle' , arguments:  data );
        },
      )

            
          
        
        ),
      );
      
      
      
                        //  SizedBox(height: 30.0);

      opciones..add( widgetTemp )
              ..add(SizedBox(height: 30.0))
              ..add( Divider());


    return opciones;

  }

  int _color ( letra){
      var i;
        if ( letra == 'A'){
              i=0;
              return i;
          } else{
                  if (letra == 'B') {
                    i=1;
                    return i;
                    
                  } else {
                     if (letra == 'C') {
                       i=2;
                      return i;
                     } else {
                       if (letra == 'D') {
                         i=3;
                        return i;
                         
                       } else {
                         if (letra == 'E') {
                           i=4;
                          return i;
                           
                         } else {
                           if (letra == 'F') {
                             i=5;
                            return i;
                             
                           } else {
                             if (letra == 'G') {
                               i=6;
                              return i;
                               
                             } else {
                               if (letra == 'H') {
                                 i=7;
                                return i;
                                 
                               } else {
                                 if (letra == 'I') {
                                   i=8;
                                  return i;
                                   
                                 } else {
                                   if (letra == 'J') {
                                     i=9;
                                    return i;
                                     
                                   } else {
                                     if (letra == 'K') {
                                       i=10;
                                      return i;
                                       
                                     } else {
                                       if (letra == 'L') {
                                         i=11;
                                        return i;
                                         
                                       } else {
                                         if (letra == 'M') {
                                           i=12;
                                          return i;
                                           
                                         } else { 
                                           if (letra == 'N') {
                                             i=13;
                                            return i;
                                             
                                           } else {
                                             if (letra == 'O') {
                                               i=14;
                                              return i;
                                               
                                             } else {
                                               if (letra == 'P') {
                                                 i=15;
                                                return i;
                                                 
                                               } else {
                                                 if (letra == 'Q') {
                                                   i=16;
                                                  return i;
                                                   
                                                 } else {
                                                   if (letra == 'R') {
                                                     i=17;
                                                    return i;
                                                     
                                                   } else {
                                                     if (letra == 'S') {
                                                       
                                                       i=18;
                                                      return i;
                                                     } else {
                                                       if (letra == 'T') {
                                                         i=19;
                                                        return i;
                                                         
                                                       } else {
                                                         if (letra == 'U') {
                                                           i=19;
                                                          return i;
                                                           
                                                         } else {
                                                           if (letra == 'V') {
                                                             i=20;
                                                            return i;
                                                             
                                                           } else {
                                                             if (letra == 'W') {
                                                               i=21;
                                                              return i;
                                                               
                                                             } else {
                                                               if (letra == 'X') {
                                                                 i=22;
                                                                return i;
                                                                 
                                                               } else {
                                                                 if (letra == 'Y') {
                                                                   i=23;
                                                                  return i;
                                                                   
                                                                 } else {
                                                                   if (letra == 'Z') {
                                                                     i=24;
                                                                    return i;
                                                                     
                                                                   } else {
                                                                     i=25;
                                                                     return i;
                                                                   }
                                                                 }
                                                               }
                                                             }
                                                           }
                                                         }
                                                       }
                                                     }
                                                   }
                                                 }
                                               }
                                             }
                                           }
                                         }
                                       }
                                     }
                                   }
                                 }
                               }
                             }
                           }
                         }
                       }
                     }
                  }
          }

    }
}
