import 'package:flutter/material.dart';

sufixIcon(bool show) {
  return show
      ? Icon(
          Icons.check_circle,
          color: Colors.green,
        )
      : Icon(
          Icons.error,
          color: Colors.red,
        );
}
