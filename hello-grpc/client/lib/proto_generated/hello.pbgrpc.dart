///
//  Generated code. Do not modify.
//  source: hello.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'hello.pb.dart' as $0;
export 'hello.pb.dart';

class HelloClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.Name, $0.Message>(
      '/Hello.Hello/SayHello',
      ($0.Name value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  HelloClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Message> sayHello($0.Name request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$sayHello, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class HelloServiceBase extends $grpc.Service {
  $core.String get $name => 'Hello.Hello';

  HelloServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Name, $0.Message>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Name.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.Message> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Name> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.Message> sayHello($grpc.ServiceCall call, $0.Name request);
}
