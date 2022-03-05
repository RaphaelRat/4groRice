import 'package:flutter/material.dart';

Widget appBarWidget(BuildContext context, {required Widget widget}) => Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height / 6, minWidth: double.infinity),
      alignment: Alignment.centerLeft,
      color: const Color.fromARGB(255, 212, 232, 231),
      child: widget,
    );
