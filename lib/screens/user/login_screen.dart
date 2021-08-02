import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network("https://i.pinimg.com/originals/a1/2f/6d/a12f6df44709e908b9e03e68e7bff6c6.png",
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(height: 32,
                  child: Text("Fruta Delivery",
                    style: TextStyle(
                    fontSize: 24,
                      color: Colors.deepOrange[400],
                      fontWeight: FontWeight.bold

                  ),),),
                ),
                Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: TextFormField(
                              controller: userController.email,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email_outlined),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Email",
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Preencha o email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: TextFormField(
                            controller: userController.password,
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: "Password",
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Preencha a senha';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400], // background
                          onPrimary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            userController.login();
                          }
                        }
                        ,
                        child: Text('Entrar'),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
    );
  }

  String validateField(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return "";
  }
}