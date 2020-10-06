#!/bin/bash
protoc -I proto proto/hello.proto --dart_out=grpc:client/lib/proto_generated --dart_out=grpc:server/lib/proto_generated