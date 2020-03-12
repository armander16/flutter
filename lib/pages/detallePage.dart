import 'dart:core';
import 'dart:math';


import 'package:directorio_ams/modal/User.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';


  
class DetallePage extends StatelessWidget {
  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {

      User opciones =   ModalRoute.of(context).settings.arguments;
      var name     = opciones.name;
      var tel      = opciones.tel;
      var user     = opciones.user;
      var _is      = opciones.isf;
      var wm       = opciones.wm;
      var gerencia = opciones.gerencia;
      var app      = opciones.app;
      var rol      = opciones.rol;
      var practica = opciones.practica;
      var correo   = opciones.email;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 67, 54, 1),//Colors.green[800],
        title: Text('$name'),
      ),
      body: 
       Stack(
        children: <Widget>[
          _fondoApp(),

          ListView(
          children: <Widget>[imagen(),
                _cardTipo1('$user', '$_is' ,  '$wm',  '$gerencia',  '$app', '$rol' , '$practica' , '$correo'),
                SizedBox(height: 30.0),
                boton('$tel'),
                    
          ]
       ),

        ],
      ),
     
     
      // floatingActionButton: FloatingActionButton(
      //   child: Icon( Icons.add_location ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
    );
    
  }

  Widget imagen(){
 return Container(
    child: 


    	
  Image.asset(
    'lib/img/icon.png',
    height: 150,
    width: 150,
    color: Colors.green[600],
 )
    // Image(
    //   image: AssetImage("lib/img/icon.png",height: 100,
    // width: 100),
    // )
  );

    // return Image(image: )
  }

  Widget _fondoApp(){

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
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

Widget boton( tel) {

 return Center (
   
        child: RaisedButton(
          child: Text('$tel'),
          
          color: Colors.green[800],
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () =>  call('$tel')  //_mostrarAlert(context),
        ),
        
      );
}
 
  Widget _cardTipo1( user,_is,wm,gerencia,app,rol,practica, mail) {
       double fontSize = 15.0;

    return Card(
      color: Color.fromRGBO(255, 255, 255, 0.1),
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            // leading: Icon( Icons.supervised_user_circle, color: Colors.blueAccent ),
            title:   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                

                Column( children: <Widget>[

                  Row(
                     children: <Widget>[
                        Text('Usuario Softtek:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( user     ,style: TextStyle(fontSize: fontSize ,color: Colors.white.withOpacity(0.6)) ),

                     ]
                     
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                          Text('IS:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( _is     ,style: TextStyle(fontSize: fontSize ,color: Colors.white.withOpacity(0.6)) )
                     ]
                     
                  )
                ], ),
                
                 
                 
                 
              ],
            ),
            
            subtitle:  //  Text('Aplicaciones: '+app),
            Column(
                              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Text('Aplicaciones:',style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                Text( app,style: TextStyle(fontSize: fontSize ,color: Colors.white.withOpacity(0.6)) ),

              ]
            )

            

          //     Row(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          
          //        Text('IS:'  , style: TextStyle(color: Colors.blue[800].withOpacity(1)) ),
          //        Text( _is     ,style: TextStyle(color: Colors.black.withOpacity(0.6)) )
          //     ],
            
            
          // ),


          ),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //      Row(
          //     children: <Widget>[
          //        Text('Aplicaciones:'  , style: TextStyle(color: Colors.blue[800].withOpacity(1)) ),
          //        Text( app,style: TextStyle(color: Colors.black.withOpacity(0.6)) )
          //     ],
          //   )
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Row(
              children: <Widget>[
                 Text('Responsable WalMart:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( gerencia     ,style: TextStyle(fontSize: fontSize ,color: Colors.white.withOpacity(0.6)) )
              ],
            )
              // FlatButton(
              //   child: Text('Cancelar'),
              //   onPressed: () {},
              // ),
              // FlatButton(
              //   child: Text('Ok'),
              //   onPressed: () {},
              // )
            ],
          ),
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 Row(
              children: <Widget>[
                 Text('Usuario WalMart:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( wm     ,style: TextStyle(fontSize: fontSize ,color: Colors.white.withOpacity(0.6)) )
              ],
            )
              ]
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Row(
              children: <Widget>[
                 Text('Rol:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( rol     ,style: TextStyle(fontSize: fontSize ,color: Colors.white10.withOpacity(0.6)) )
              ],
            )
            ],
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Row(
              children: <Widget>[
                 Text('Práctica:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( practica     ,style: TextStyle(fontSize: fontSize ,color: Colors.white10.withOpacity(0.6)) )
              ],
            )
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Row(
              children: <Widget>[
                 Text('Email:'  , style: TextStyle(fontSize: fontSize ,color: Colors.green[300].withOpacity(1)) ),
                 Text( mail ,style: TextStyle(fontSize: fontSize ,color: Colors.white54.withOpacity(0.6)) )
              ],
            )
            ],
          ),
                    ],
      ),
    );

  }



  void call(String number) => launch("tel:$number");


// Widget animacion (){
//  return AnimatedDefaultTextStyle(

//     child: Text('sofftek'),  overflow: TextOverflow.ellipsis, duration: const Duration(microseconds : 300), 
//     style: TextStyle( 
//       fontSize: 60,
//       color: Colors.black ,
//       fontWeight: FontWeight.bold,
//       ),
//   );
// }





  void _mostrarAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo( size: 100.0 )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      }

    );


  }

}
