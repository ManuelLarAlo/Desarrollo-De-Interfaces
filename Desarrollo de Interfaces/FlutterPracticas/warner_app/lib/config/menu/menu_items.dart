import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Tienda', 
    link: '/counter-river', 
    icon: Icons.store
  ),

  MenuItem(
    title: 'Como legar', 
    link: '/buttons', 
    icon: Icons.map
  ),

    MenuItem(
    title: 'Horario de apertura', 
    link: '/counter-river', 
    icon: Icons.calendar_month
  ),

  MenuItem(
    title: 'Otros servicios', 
    link: '/buttons', 
    icon: Icons.credit_card
  ),

    MenuItem(
    title: 'Normas de funcionamiento', 
    link: '/counter-river', 
    icon: Icons.rule
  ),

];



