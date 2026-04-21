// lib/pages/sign_in/sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());
  
  SignInPage({super.key});

  Widget _form(BuildContext context){
    ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20), 
              child: Column(
                children: [
                  Text('Ingresa esta información'),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.person),
                      border: null,
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                      border: null,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Futuro mensaje',
                    style: TextStyle(
                    color: Colors.red,
                  ),),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.secondaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Ingresar'),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No tienes una cuenta? ',
                        style: TextStyle(
                      ),),
                      Text('Creala aquí',
                        style: TextStyle(
                        color: Colors.red,
                      ),),
                    ],
                  )
                ],
              )
            ),
          );
  }

  Widget _foreground(BuildContext context){
    ColorScheme colors = Theme.of(context).colorScheme;

      return SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset('assets/images/ulises_circle.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Biblio App',
              style: TextStyle(
                color: colors.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _form(context),
            Spacer(), // 👈 esto empuja hacia abajo
            Text('Futuro mensaje'),
            SizedBox(height: 20),
          ]
      ));
  }

  Widget _background(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Expanded(
          flex: 4, // 40%
          child: Container(
            width: double.infinity,
            color: colors.tertiaryFixedDim,
          ),
        ),
        Expanded(
          flex: 6, // 60%
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _background(context),
        _foreground(context) 
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
