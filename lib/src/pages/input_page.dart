import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _selectedOption = 'Volar';

  TextEditingController _inputDateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _makeNameInput(),
          Divider(),
          _makeEmailInput(),
          Divider(),
          _makePasswordInput(),
          Divider(),
          _makeDateInput(context),
          Divider(),
          _makeDropdown(),
          Divider(),
          _makePerson(),
        ],
      ),
    );
  }

  Widget _makeNameInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Caracteres ${_name.length}'),
        hintText: 'Introduce nombre',
        labelText: 'Nombre',
        helperText: 'Introduce tu nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _makeEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Introduce email',
        labelText: 'E-mail',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _makePasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Introduce contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.remove_red_eye),
        icon: Icon(Icons.lock_open),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _makeDateInput(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateFieldController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1950),
        lastDate: new DateTime(2100),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDateFieldController.text = _date;
      });
    }
    return picked;
  }

  List<String> _power = ['Volar', 'RayosX', 'Super oído', 'Antibalas'];

  List<DropdownMenuItem<String>> _getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();
    _power.forEach((element) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return list;
  }

  Widget _makeDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _selectedOption,
              items: _getDropdownOptions(),
              onChanged: (option) {
                setState(() {
                  _selectedOption = option;
                });
                print(option);
              }),
        ),
      ],
    );
  }

  Widget _makePerson() {
    return ListTile(
      title: Text('Nombre es $_name'),
      subtitle: Text('Email es $_email'),
      trailing: Text(_selectedOption),
    );
  }
}
