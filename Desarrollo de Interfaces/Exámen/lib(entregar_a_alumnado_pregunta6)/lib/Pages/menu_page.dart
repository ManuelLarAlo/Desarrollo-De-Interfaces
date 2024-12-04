import 'package:flutter/material.dart';
import 'package:iseneca_jandula/Providers/usuarios_provider.dart';

class MenuPage extends StatelessWidget {
  final usuariosProvider = UsuariosProvider();

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;

    final String _userpass = ModalRoute.of(context).settings.arguments;
    
    _userpass.substring(_userpass.lastIndexOf(',') + 1, _userpass.length);
    
    return Scaffold(
      body: cuerpoBody(_sizeScreen),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'Agenda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger), label: 'Comunicaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menú')
        ],
      ),
    );
  }

  SafeArea cuerpoBody(Size _sizeScreen) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: _sizeScreen.height * 0.2,
            color: Color.fromRGBO(2, 64, 127, 1.0),
            child: Text('iSéneca',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 56.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            //width: double.infinity,
            height: _sizeScreen.height * 0.66,
            //color: Colors.white,
            //color: Color.fromRGBO(2, 64, 127, 1.0),
            child: Table(
              //crossAxisCount: 3,
              children: [
                TableRow(children: [
                  Container(
                      height: _sizeScreen.height * 0.22, child: tarjetavacia()),
                  Container(
                      height: _sizeScreen.height * 0.22, child: tarjetavacia()),
                  Container(
                      height: _sizeScreen.height * 0.22, child: tarjetavacia()),
                ]),
                TableRow(children: [
                  Container(
                      height: _sizeScreen.height * 0.22,
                      child:
                          tarjeta('assets/img/logo_mio.png', 'Alumnado del', 'Centro')),
                  Container(
                      height: _sizeScreen.height * 0.22,
                      child: tarjeta(
                          'assets/img/logo_mio.png', 'Personal del', 'Centro')),
                  Container(
                      height: _sizeScreen.height * 0.22,
                      child: tarjeta(
                          'assets/img/logo_mio.png', 'Información', 'Covid')),
                ]),
                TableRow(children: [
                  Container(
                      height: _sizeScreen.height * 0.22,
                      child: tarjeta(
                          'assets/img/logo_mio.png', 'Tablón de', 'Anuncios')),
                  Container(
                      height: _sizeScreen.height * 0.22,
                      child: tarjeta(
                          'assets/img/logo_mio.png', 'Calendario', 'Escolar')),
                  Container(
                      height: _sizeScreen.height * 0.22, child: tarjetavacia()),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tarjeta(String rutaimagen, String etiqueta1, String etiqueta2) {
    return Card(
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 50,
            width: 50,
            image: AssetImage(rutaimagen),
          ),
          Text(etiqueta1),
          Text(etiqueta2),
        ],
      ),
    );
  }

  Widget tarjetavacia() {
    return Center(
      child: Card(
        child: Text(''),
      ),
    );
  }
}
