import 'package:client/env.dart';
import 'package:client/proto_generated/hello.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text;

  ClientChannel channel;
  HelloClient stub;
  initialize() async {
    channel = ClientChannel(RPC_HOST,
        port: RPC_PORT,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    stub = HelloClient(channel);
  }

  @override
  void initState() {
    super.initState();
    _text = '...';
    initialize();
  }

  @override
  dispose() {
    channel.shutdown();
    super.dispose();
  }

  sayHello() async {
    try {
      print("Say Hello ${channel.host}:${channel.port}");
      final Message result = await stub.sayHello(Name()..name = "Raveesh");
      _text = result.message;
      print(_text);
      setState(() {});
    } catch (r) {
      print(r);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(_text),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sayHello,
      ),
    );
  }
}
