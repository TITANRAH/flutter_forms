import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  // final _formKey = GlobalKey<FormState>();

  String? _emailValidator(String? text) {
    text ??= ''; //es lo mismo que text = text ?? '';
    final isValid = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(text);

    if (isValid) {
      return null;
    }

    return 'Invalid email address';
  }

  String? _passwordValidator(String? text) {
    text ??= '';
    if (text.length >= 8) {
      return null;
    }

    return 'Invalid password';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _emailValidator,
                onChanged: (text) {
                  setState(() {
                    _email = text.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('email'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _passwordValidator,
                onChanged: (text) {
                  setState(() {
                    _password = text.trim();
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('password'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _subimit,
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // comente por que use autovalidatemode

//   // puedo usar el contexto, tuve que encerrar el boton en un builder para utulizarlo
//   void _subimit(BuildContext context) {
//     // if(_formKey.currentState!.validate()){

//     //   //SI ES VALIDO REALIZAR FUCNCION DE FORM
//     // }

// // Form.of(context); encuentra al form mas cercano y retorna su estado
//     final formState = Form.of(context);

//     if (formState!.validate()) {
//       print('paso las validaciones');
//     }

//     // _formKey.currentState!.reset();
//   }

  // puedo usar el contexto, tuve que encerrar el boton en un builder para utulizarlo
  void _subimit() {
    // if(_formKey.currentState!.validate()){

    //   //SI ES VALIDO REALIZAR FUCNCION DE FORM
    // }

// Form.of(context); encuentra al form mas cercano y retorna su estado

    // _formKey.currentState!.reset();
  }
}
