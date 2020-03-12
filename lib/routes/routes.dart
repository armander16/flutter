import 'package:directorio_ams/pages/detallePage.dart';
import 'package:directorio_ams/pages/userPage.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'      : ( BuildContext context ) => UserFilterDemo(),
      'detalle'  : ( BuildContext context ) => DetallePage(),
   
  };

}