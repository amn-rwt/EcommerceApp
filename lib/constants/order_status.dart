import 'package:flutter/material.dart';

Map<String, Icon> orderStatus = {
  'Deliverd': const Icon(Icons.done, color: Colors.greenAccent),
  'Canceled': const Icon(Icons.cancel, color: Colors.redAccent),
  'Arriving Soon': const Icon(Icons.local_shipping, color: Colors.orangeAccent),
};
