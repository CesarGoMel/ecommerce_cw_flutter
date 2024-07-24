import 'package:ecommerce_cw_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:ecommerce_cw_flutter/src/presentation/witgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlocCubit? _loginBlocCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginBlocCubit?.dispose();
    }
    );
    
  }

  @override
  
  Widget build(BuildContext context) {

    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);

    return  Scaffold(
      body: Container(
        width: double.infinity,
        child:  Stack(
          alignment: Alignment.center,
          children: [

            StreamBuilder(
              stream: _loginBlocCubit?.responseStream, 
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state is Error) {
                  Fluttertoast.showToast(
                    msg: state.message,
                    toastLength: Toast.LENGTH_LONG
                  );
                }
                else if (state is Success) {
                  Fluttertoast.showToast(
                    msg: 'Login exitoso',
                    toastLength: Toast.LENGTH_LONG
                  );
                }
                return Container();
              }
            
            ),

           Image.asset(
              'assets/img/fondo.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
              ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Color.fromARGB(48, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(30))
               ),
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 50),
                    child: Image.asset(
                      'assets/img/logocw.png',
                                          ),
                  ),
                  /*Icon(            
                    Icons.person,
                   color: Colors.black,
                    size: 125,
                  ),*/
                  Text('INGRESAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),                    
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.emailStream,
                      builder: (context, snapshot) {
                        return DefaultTextField(
                          label: 'Email',
                          icon: Icons.email,
                          errorText: snapshot.error?.toString(),
                          onChanged: (text){
                            _loginBlocCubit?.changeEmail(text);
                          },
                          );
                      }
                    )
                  ),
                   Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                     child: StreamBuilder(
                       stream: _loginBlocCubit?.passwordStream,
                       builder: (context, snapshot) {
                         return DefaultTextField(
                          label: 'Constraseña',
                          icon: Icons.lock,
                          errorText: snapshot.error?.toString(),
                          onChanged: (text){
                            _loginBlocCubit?.changePassword(text);
                            
                          },
                          obscureText: true,
                          );
                       }
                     )
                   ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15 ),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.validateForm,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: () {
                            if(snapshot.hasData){
                            _loginBlocCubit?.login();
                          }
                          else{
                            Fluttertoast.showToast(msg: 'Formulario no Valido',
                            toastLength: Toast.LENGTH_LONG);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: snapshot.hasData ?  Color.fromARGB(255, 25, 26, 23) : Colors.grey
                        ),        
                        child: Text(
                          'INICIAR SESION',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255)
                            ),
                          ),
                        );
                      }
                    ),
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 65,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text(
                        '¿No tienes Cuenta?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                              
                        ),
                        ),
                        Container(
                        width: 65,
                        height: 1,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 5)
                      ),
                    ],
                  ),
                             
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15 ),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      }, 
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255)
                    ),
                    child: Text(
                      'REGISTRATE',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0)
                        ),
                      ),
                    ),
                  ),
              
                ],
                ),
            ),
          ],
        ),
      )
  );
  }
}