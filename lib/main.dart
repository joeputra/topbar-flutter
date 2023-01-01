import 'package:flutter/material.dart';
import 'package:tapbar_content/ui/home.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeStatePage(),
    ));
