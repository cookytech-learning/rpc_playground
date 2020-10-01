library server;

import 'package:grpc/grpc.dart' as grpc;

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server([]);
    await server.serve(port: 8080);
    print('Server Listening at ${ server.port}');
  }
}
