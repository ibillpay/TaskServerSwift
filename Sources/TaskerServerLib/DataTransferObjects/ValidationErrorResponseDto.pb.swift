// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ValidationErrorResponseDto.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct ValidationErrorResponseDto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var message: String = String()

  var errors: [ErrorDto] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ErrorDto {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var field: String = String()

  var messages: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ValidationErrorResponseDto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ValidationErrorResponseDto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    4: .same(proto: "message"),
    6: .same(proto: "errors"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 4: try decoder.decodeSingularStringField(value: &self.message)
      case 6: try decoder.decodeRepeatedMessageField(value: &self.errors)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 4)
    }
    if !self.errors.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.errors, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ValidationErrorResponseDto) -> Bool {
    if self.message != other.message {return false}
    if self.errors != other.errors {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ErrorDto: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ErrorDto"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "field"),
    2: .same(proto: "messages"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.field)
      case 2: try decoder.decodeRepeatedStringField(value: &self.messages)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.field.isEmpty {
      try visitor.visitSingularStringField(value: self.field, fieldNumber: 1)
    }
    if !self.messages.isEmpty {
      try visitor.visitRepeatedStringField(value: self.messages, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: ErrorDto) -> Bool {
    if self.field != other.field {return false}
    if self.messages != other.messages {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}