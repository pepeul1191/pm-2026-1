import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfileController control = Get.put(ProfileController());

  ProfilePage({super.key});

  Widget _profileImage() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Imagen circular con borde blanco
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/93.jpg',
              ),
            ),
          ),

          // Botón de editar (lápiz) - VERSIÓN MÁS PEQUEÑA
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                iconSize: 20,
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ CORREGIDO: Ahora este widget devuelve un TextField con ancho controlado
  Widget _userForm(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    String? selectedValue;

    return Expanded(  // 👈 El Expanded va AQUÍ, dentro del Row
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Usuario',
              border: UnderlineInputBorder(),
            ),
            style: TextStyle(fontSize: 14),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              labelText: 'Correo',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {},
              child: Text('Actualizar Datos', style: TextStyle(fontSize: 12),),
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {},
              child: Text('Cambiar Contraseña', style: TextStyle(fontSize: 12),),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            readOnly: true, // 👈 evita escritura manual
            decoration: InputDecoration(
              labelText: 'Fecha',
              border: UnderlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                String formattedDate =
                    "${pickedDate.day.toString().padLeft(2, '0')}/"
                    "${pickedDate.month.toString().padLeft(2, '0')}/"
                    "${pickedDate.year}";

                // aquí guardas el valor (ej: setState o controller)
                print(formattedDate);
              }
            },
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Opción',
              border: UnderlineInputBorder(),
            ),
            value: selectedValue,
            items: [
              DropdownMenuItem(
                value: 'opcion1',
                child: Text('Opción 1'),
              ),
              DropdownMenuItem(
                value: 'opcion2',
                child: Text('Opción 2'),
              ),
              DropdownMenuItem(
                value: 'opcion3',
                child: Text('Opción 3'),
              ),
            ],
            onChanged: (value) {
              selectedValue = value;
            },
          )
        ],),
      ),
    );
  }

  // ✅ CORREGIDO: El Row ahora está bien estructurado
  Widget _userAccount(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,  // Aumentado a 90%
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagen de perfil (sin Center, porque ya es pequeña)
          SizedBox(
            width: 120,  // Ancho fijo para la imagen
            child: _profileImage(),
          ),
          // Formulario de usuario (usando Expanded)
          _userForm(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'Cuenta del Usuario',
            style: TextStyle(
              color: colors.tertiary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Center(child: _userAccount(context)),
          Spacer(),
          Text('Futuro mensaje'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }
}