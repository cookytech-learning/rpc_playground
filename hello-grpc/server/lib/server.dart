library server;

import 'package:grpc/grpc.dart' as grpc;
import 'package:server/src/hello/hello_service.dart';

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server([HelloService()]);
    await server.serve(port: 8085);
    print('Server Listening at ${ server.port}');
  }
}
