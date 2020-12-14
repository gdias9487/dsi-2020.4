import 'package:dsi_app/constants.dart';
import 'package:dsi_app/infra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsi_app/person.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Image(
            image: Images.profile,
            height: 200,
          ),
          Spacer(flex: 1),
          Text(
            'Insira suas informações abaixo:',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Constants.spaceSmallHeight,
          PersonForm(),
          Spacer(),
        ],
      ),
    );
  }
}

class PersonForm extends StatefulWidget {
  @override
  PersonFormState createState() {
    return PersonFormState();
  }
}

class PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();

  void _Person() {
    if (!_formKey.currentState.validate()) return;

    dsiDialog.showInfo(
      context: context,
      message: 'Usuário cadastrado com sucesso.',
      buttonPressed: () => dsiHelper..back(context)..back(context),
    );

    //A linha acima é equivalente a executar as duas linhas abaixo:
    //Navigator.of(context).pop();
    //Navigator.of(context).pop();
    //
    //Para maiores informações, leia sobre 'cascade notation' no Dart.
    //https://dart.dev/guides/language/language-tour
  }

  void _cancel() {
    dsiHelper.back(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: Constants.paddingMedium,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Nome*'),
              validator: (String value) {
                return value.isEmpty ? 'Preencha seus dados' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Sobrenome*'),
              validator: (String value) {
                return value.isEmpty ? 'Preencha seus dados' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: 'Data de Nascimento* (DD/MM/AA)'),
              validator: (String value) {
                return value.isEmpty ? 'Preencha seus dados' : null;
              },
            ),
            Constants.spaceSmallHeight,
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'CPF* (Apenas números)'),
              validator: (String value) {
                return value.isEmpty ? 'Campo vazio' : null;
              },
            ),
            Constants.spaceMediumHeight,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Cadastrar'),
                onPressed: _Person,
              ),
            ),
            FlatButton(
              child: Text('Voltar'),
              padding: Constants.paddingSmall,
              onPressed: _cancel,
            ),
          ],
        ),
      ),
    );
  }
}
