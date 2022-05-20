import 'package:flutter/material.dart';

PopupMenuEntry popupMenuItem(int _value, IconData _icon, String _label) {
  return PopupMenuItem(
    value: _value,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          _icon,
          color: Colors.grey[600],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            _label,
            style: TextStyle(
              color: Colors.grey[600],
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
