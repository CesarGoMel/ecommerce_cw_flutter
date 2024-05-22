import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultButton.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultIconBack.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  RegisterBlocCubit? _registerBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });
  }

  Widget build(BuildContext context) {
    _registerBlocCubit =
        BlocProvider.of<RegisterBlocCubit>(context, listen: false);

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
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.nameStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                                label: 'Nombres',
                                icon: Icons.person,
                                onChanged: (text) {
                                  _registerBlocCubit?.changeName(text);
                                });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.lastnameStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                                label: 'Apellidos',
                                icon: Icons.person,
                                onChanged: (text) {
                                  _registerBlocCubit?.changeLastname(text);
                                });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.emailStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                                label: 'Email',
                                icon: Icons.mail,
                                onChanged: (text) {
                                  _registerBlocCubit?.changeEmail(text);
                                });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.phoneStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                                label: 'Teléfono',
                                icon: Icons.phone,
                                onChanged: (text) {
                                  _registerBlocCubit?.changePhone(text);
                                });
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.passwordStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                              label: 'Contraseña',
                              icon: Icons.lock,
                              onChanged: (text) {
                                _registerBlocCubit?.changePassword(text);
                              },
                              obscureText: true,
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.confirmpasswordStream,
                          builder: (context, snapshot) {
                            return DefaultTextField(
                              label: 'Confirmar Contraseña',
                              icon: Icons.lock_outline,
                              onChanged: (text) {
                                _registerBlocCubit?.changeConfirmpassword(text);
                              },
                              obscureText: true,
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: StreamBuilder(
                          stream: _registerBlocCubit?.validateFrom,
                          builder: (context, snapshot) {
                            return DefaultButton(
                                text: 'REGISTRARME',
                                color: snapshot.hasData ? Color.fromARGB(255, 152, 0, 0) : Colors.grey,
                                onPressed: () {
                                  if (snapshot.hasData) {
                                    _registerBlocCubit?.register();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'El formulario no es valido',
                                        toastLength: Toast.LENGTH_LONG);
                                  }
                                });
                          }),
                    )
                  ],
                ),
              ),
            ),
            DefaultIconBack(left: 45, top: 125)
          ])),
    );
  }
}
