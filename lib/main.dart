import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  List<String> _tarefas = ['Estudar'];
  String tarefa;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('CDM - Tarefa A2.1'))),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Center(
              child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Título da tarefa:",
                      hintText: "Insira o título da tarefa",
                    ),
                    onChanged: (valor) {
                      tarefa = valor;
                    },
                  )
            )
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Center(
              child: RaisedButton(
                  onPressed: () {
                      setState(() {
                      _tarefas.add(tarefa);
                    });
                  },
                  child: Text(
                    'Adicionar',
                    style: TextStyle(fontSize: 22),
                  )),
            )),
            Column(
                children: _tarefas
                    .map((element) => Card(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                child: Text(
                                  element,
                                  style: TextStyle(fontSize: 18),
                                ),
                                padding: EdgeInsets.all(5.0),
                              )
                            ],
                          ),
                        ))
                    .toList()),
          ]),
      ),
    );
  }

  String _tarefa;

  void _addTarefa(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar Tarefa"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => 
                setState(() {
                  _tarefas.add(_tarefa);
                }),
              child: Text("Incluir"),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
          ],
          content: Form(
            child: Column(children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Título da tarefa:",
                  hintText: "Insira o título da tarefa",
                ),
                onChanged: (valor) {
                  _tarefa = valor;
                },
              )
            ],),
          ) 
        );
      },
    );
  }
}


