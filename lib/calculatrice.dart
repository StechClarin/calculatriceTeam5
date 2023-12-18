import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  String Userinput = "";
  String result = "0";
  List<String> buttonList = [
    'Ac',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '6',
    '5',
    '4',
    '-',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2630),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height /
              3, //mediaquery.../3 nous permet recupéer la taille de l'ecran et de le diviser par trois
          // j'ai donc SizedBox à une hauteur qui vaut 1/ de la taille de l'ecran
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  Userinput,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                )),
          ]),
        ),
        Divider(color: Colors.white),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: buttonList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CustomButton(buttonList[index]);
            },
          ),
        ))
      ]),
    );
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Color(0xFF1d2630),
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 2,
              spreadRadius: 0.5,
              offset: Offset(-3, -3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getColor(text),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.white;
  }
}
