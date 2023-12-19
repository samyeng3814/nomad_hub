import 'package:flutter/material.dart';

import 'package:nomad_hub/core/utils/page_trasition.dart';

popContext(context, [dynamic result]){
  Navigator.pop(context);
}

pushContext(context, {required Widget route, Function(dynamic)? function}){
Navigator.push(context, createRoute(route)).then((value) {
  if(value != null && function != null){
    function(value);
  }
});
}

pushReplacementContext(context, {required Widget route, Function(dynamic)? function}){
  Navigator.pushReplacement(context, createRoute(route)).then((value)  {
    if(value != null ){
      function!(value);
    }
  });
}