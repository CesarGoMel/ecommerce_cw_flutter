import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        child:  Stack(
          children: [
            Image.asset(
              'assets/img/ninos.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
              ),
            Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/logocw.png'
                  ),
                /*Icon(            
                  Icons.person,
                 color: Colors.black,
                  size: 125,
                ),*/
                Text('LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                TextField(
                  decoration: InputDecoration(
                    label: Text('Email')
                  ),
                ),
                 TextField(
                  decoration: InputDecoration(
                    label: Text('Contraseña')
                  ),
                ),
                ElevatedButton(
                  onPressed: () {}, 
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),        
                child: Text(
                  'INICIAR SESION',
                  style: TextStyle(
                    color: Colors.black
                    ),
                  ),
                ),
            
                Text('¿No tienes Cuenta?'),
                           
                ElevatedButton(
                  onPressed: () {}, 
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0)
                ),
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(
                    color: Colors.white
                    ),
                  ),
                ),
            
              ],
              ),
          ],
        ),
      )
  );
  }
}