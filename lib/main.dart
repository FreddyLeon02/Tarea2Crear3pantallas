import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/group.dart';

import 'src/models/event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi aplicación de eventos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Eventos'),
        ),
        body: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(events[index].logo),
              title:
                  Text('Id: ${events[index].id} name: ${events[index].name}'),
              subtitle: Text(events[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GroupListRoute(event: events[index])),
                );
                print('Se seleccionó el evento ${events[index].name}');
              },
            );
          },
        ),
      ),
    );
  }
}

/*class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos"),
      ),
      body: ListView.builder(
        itemCount: event.group.length,
        itemBuilder: (context, index) {
          final group = event.group[index];
          return ListTile(
            leading: Image.asset(event.group[index].logo),
            title: Text('Id: ${group.id} name: ${group.name}'),
            subtitle: Text(group.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
              print('Se seleccionó el grupo ${group.name}');
            },
          );
        },
      ),
    );
  }
}*/

class GroupListRoute extends StatelessWidget {
  final Event event;

  GroupListRoute({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos del evento ${event.name}"),
      ),
      body: ListView.builder(
        itemCount: event.group.length,
        itemBuilder: (context, index) {
          final group = event.group[index];
          return ListTile(
            leading: Image.asset(group.logo),
            title: Text('Id: ${group.id} name: ${group.name}'),
            subtitle: Text(group.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroupDetailRoute(group: group)),
              );
              print('Se seleccionó el grupo ${group.name}');
            },
          );
        },
      ),
    );
  }
}

class GroupDetailRoute extends StatelessWidget {
  final Group group;

  GroupDetailRoute({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del grupo ${group.name}"),
      ),
      body: ListView.builder(
        itemCount: group.persons.length,
        itemBuilder: (context, index) {
          final persons = group.persons[index];
          return ListTile(
            title: Text('Id: ${persons.id} name: ${persons.name}'),
            subtitle: Text(persons.phone),
          );
        },
      ),
    );
  }
}
