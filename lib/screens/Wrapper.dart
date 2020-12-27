  

import 'package:firebasee/models/Userr.dart';
import 'package:firebasee/screens/authenticate/authenticate.dart';
import 'package:firebasee/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Userrs>(context);
    
    // return either the Home or Authenticate widget
    if(user == null) {
      return Authenticate();
    }else {
      return Home();
    }
    
  }
}