import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms/pages/login/login_mixin.dart';
import 'package:forms/pages/login/widgets/login_checkbox.dart';
import 'package:forms/pages/login/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  String _email = '', _password = '';
  // final _formKey = GlobalKey<FormState>();

  // bool _checked = false;

  @override
  Widget build(BuildContext context) {
    // si se cumple la validacion retornara nul por lo tanto retornara true
    bool allowSubmit = emailValidator(_email) == null;

    if (allowSubmit) {
      // si es nulo paso la validacion
      allowSubmit = passwordValidator(_password) == null;
    }

    // if (allowSubmit) {}

    return Form(
      // key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              LoginTextField(
                label: 'email',
                textInputAction: TextInputAction.next,
                validator: emailValidator,
                onChanged: (text) {
                  setState(() {
                    _email = text.trim();
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              Builder(builder: (context) {
                return LoginTextField(
                  onSubmitted: (_) => _subimit(context),
                  label: 'password',
                  textInputAction: TextInputAction.send,
                  validator: passwordValidator,
                  onChanged: (text) {
                    setState(() {
                      _password = text.trim();
                    });
                  },
                  obscureText: true,
                  // keyboardType: TextInputType.visiblePassword,
                );
              }),
              // const SizedBox(
              //   height: 30,
              // ),
              // LoginCheckbox(
              //   initialValue: _checked,
              //   validator: checkboxValidator,
              //   onChanged: (value) {
              //     setState(() {
              //       _checked = value;
              //     });
              //   },
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              // ),
              const SizedBox(height: 30),
              Builder(builder: (context) {
                return MaterialButton(
                  elevation: 0,
                  color: Colors.blue.withOpacity(allowSubmit ? 1 : 0.2),
                  onPressed: () => _subimit(context),
                  child: const Text('Sign in'),
                );
              }),
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
  void _subimit(BuildContext context) {
    final formState = Form.of(context);

    if (formState!.validate() ?? false) {
      print('funciona la validacioj');
    }
    // if(_formKey.currentState!.validate()){

    //   //SI ES VALIDO REALIZAR FUCNCION DE FORM
    // }

// Form.of(context); encuentra al form mas cercano y retorna su estado

    // _formKey.currentState!.reset();
  }
}
