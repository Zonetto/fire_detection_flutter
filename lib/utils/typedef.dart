import 'package:flutter/material.dart';

typedef VoidCallback = void Function();
typedef VoidValidCallback = void Function(String)?;
typedef ValidCallback = String? Function(String?);
typedef ItemBuilderCallback = Widget? Function(BuildContext, int);
typedef DynamicCallback = Function(dynamic)?;
