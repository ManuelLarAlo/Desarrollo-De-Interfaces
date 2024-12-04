import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final String name;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.name,
  });
}

const List<MenuItems> appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones', 
    subtitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined,
    name: ButtonsScreen.name,
  ),
    MenuItems(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card,
    name: CardsScreen.name,
  ),
    MenuItems(
      title: 'ProgressIndicators', 
      subtitle: 'Generales y Controladores', 
      link: '/progress', 
      icon: Icons.refresh_outlined, 
      name: 'si'
    ),
];