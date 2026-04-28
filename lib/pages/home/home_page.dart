import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomeController control = Get.put(HomeController());

  HomePage({super.key});

  Widget _buildBody(BuildContext context) {
    return SafeArea(child: Text('Home Page'));
  }

  void _mostrarAlerta(BuildContext context, String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<String> _menu(BuildContext context){
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'perfil') {
          _mostrarAlerta(context, 'Perfil', 'Vas a ir al perfil');
        } else if (value == 'config') {
          _mostrarAlerta(context, 'Configuración', 'Vas a ir a configuración');
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'perfil',
          child: Text('Perfil'),
        ),
        PopupMenuItem(
          value: 'config',
          child: Text('Configuración'),
        ),
      ],
    );
  }

  Widget _bottomNavBar(BuildContext context){
    return Obx(() => BottomNavigationBar(
      currentIndex: control.selectedIndex.value,
      onTap: control.changeTab,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Libros',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          actions: [
            _menu(context),
          ],
          title: Text(
            "Biblio App UL", 
            style: TextStyle(
                color: colors.primary
              ),
            ),
          backgroundColor: colors.onSecondary
        ),
        bottomNavigationBar: _bottomNavBar(context),
        body: _buildBody(context),
      );
  }
}
