import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
          _cardType1(),
          SizedBox(
            height: 15.0,
          ),
          _cardType2(),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(
                'Litteris torquatis corporum, puto posteri legatis ruant vetuit posse referta elegantis.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: null, child: Text('Cancelar')),
              FlatButton(onPressed: null, child: Text('OK')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              height: 300.0,
              image: NetworkImage(
                  'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg')),
          Container(padding: EdgeInsets.all(10.0), child: Text('Algun texto')),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(10.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 5.0))
        ],
      ),
    );
  }
}
