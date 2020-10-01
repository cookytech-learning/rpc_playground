import 'package:grpc/src/server/service.dart';
import 'package:grpc/src/server/call.dart';
import 'package:server/proto_generated/hello.pbgrpc.dart';

class HelloService extends HelloServiceBase {
  @override
  Future<Message> sayHello(ServiceCall call, Name request) =>
      Future.value(Message()..message = 'Hello ${request.name}');
}
