import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultButton.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultIconBack.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.center, children: [
            
            Image.asset(
              'assets/img/fr2.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Color.fromRGBO(0, 0, 0, 0.3),
              colorBlendMode: BlendMode.darken,
            ),
          
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5),
                    child: Image.asset(
                      'assets/img/logocw.png',
                      width: MediaQuery.of(context).size.width * 0.55,
                                          ),
                  ),
                   /* Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 100,
                    ),*/
                    Text(
                      'Dejanos Saber de ti:',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                          ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Nombres', 
                        icon: Icons.person, 
                        onChanged: (text) {}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Apellidos', 
                        icon: Icons.person, 
                        onChanged: (text) {}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Email', 
                        icon: Icons.mail, 
                        onChanged: (text) {}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Teléfono', 
                        icon: Icons.phone, 
                        onChanged: (text) {}
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Contraseña', 
                        icon: Icons.lock, 
                        onChanged: (text) {},
                        obscureText: true,
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextField(
                        label: 'Confirmar Contraseña', 
                        icon: Icons.lock_outline, 
                        onChanged: (text) {},
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: DefaultButton(
                        text: 'REGISTRARME', 
                        //color: Colors.cyan,
                        onPressed: () {}
                      ),
                    )
                  ],
                ),
              ),
            ),
              DefaultIconBack(
                left: 45, 
                top: 125)
          ]
          )
          ),
    );
  }
}
