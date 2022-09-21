import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      title: Text(
        'Cadastro de Pessoas\n Carregando...',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      seconds: 8,
      navigateAfterSeconds: HomePage(),
      image: Image.asset('assets/images/bg-removebg-preview.png'),
      backgroundColor: Color(0xFFe1d4af),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 250.0,
      // onClick: () => print("TJRS"),
      loaderColor: Colors.white,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Define a key to access the form
  final formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';
  String telefone = '';
  String dataNacimento = '';

  // This function is triggered when the user press the "Sign Up" button
  void trySubmitForm() {
    final bool? isValid = formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Tudo certo!');
      debugPrint(email);
      debugPrint(nome);
      debugPrint(telefone);
      debugPrint(dataNacimento);

      /*
      Continute proccessing the provided information with your own logic
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFe1d4af),
        alignment: Alignment.center,
        child: Center(
          child: Card(
            color: Color(0xFFd5d1c8),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image.network( // <-- SEE HERE
                      //   'https://www.tjrs.jus.br/novo/busca/wp-content/themes/tjrs/images/img/logo.png',
                      // ),

                      Image.asset('assets/images/logo.png'),
                      SizedBox(height: 50),

                      /// nome
                      TextFormField(
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.grey), //<-- SEE HERE
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Esse campo é obrigatório!';
                          }
                          if (value.trim().length < 3) {
                            return 'o campo Nome deve ter no minimo 3 caracteres!';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => nome = value,
                      ),
                      SizedBox(height: 10),

                      /// Eamil
                      TextFormField(
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.grey), //<-- SEE HERE
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                        onChanged: (value) => email = value,
                      ),
                      SizedBox(height: 10),

                      /// Telefone
                      TextFormField(
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Telefone',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.grey), //<-- SEE HERE
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Esse campo é obrigatório!';
                          }
                          if (value.trim().length < 8) {
                            return 'o campo Telefone deve ter no minimo 8 caracteres!';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => nome = value,
                      ),
                      SizedBox(height: 10),

                      /// Data de Nascimento
                      TextFormField(
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Data de Nascimento',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.grey), //<-- SEE HERE
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Esse campo é obrigatório!';
                          }
                          if (value.trim().length < 8) {
                            return 'o campo Data de Nascimento Precisa ser uma data válida!';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => nome = value,
                      ),
                      const SizedBox(height: 50),
                      Container(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  side:
                                      BorderSide(width: 2, color: Colors.grey),
                                  backgroundColor: Color(0xFFe1d4af),
                                  primary: Colors.black),
                              onPressed: trySubmitForm,
                              child: (const Text('Salvar'))))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
