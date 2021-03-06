//
//  FakeHTTPRequest.swift
//  TaskerServerLibTests
//
//  Created by Marcin Czachurski on 14.02.2018.
//

import Foundation
import PerfectHTTP
import PerfectNet
import Dobby
import SwiftProtobuf
@testable import TaskerServerLib

class FakeHTTPRequest: HTTPRequest {

    var method: HTTPMethod = HTTPMethod.get
    var path: String = ""
    var pathComponents: [String] = []
    var queryParams: [(String, String)] = []
    var protocolVersion: (Int, Int) = (1, 0)
    var remoteAddress: (host: String, port: UInt16) = ("", 0)
    var serverAddress: (host: String, port: UInt16) = ("", 0)
    var serverName: String = ""
    var documentRoot: String = ""
    var connection: NetTCP = NetTCP()
    var urlVariables: [String: String] = [:]
    var scratchPad: [String: Any] = [:]
    var headers: AnyIterator<(HTTPRequestHeader.Name, String)> = AnyIterator { return nil }
    var postParams: [(String, String)] = []
    var postBodyBytes: [UInt8]?
    var postBodyString: String?
    var postFileUploads: [MimeReader.BodySpec]?

    let headerMock = Mock<(HTTPRequestHeader.Name)>()
    let headerStub = Stub<(HTTPRequestHeader.Name), String?>()

    let addHeaderMock = Mock<(HTTPRequestHeader.Name, String)>()
    let setHeaderMock = Mock<(HTTPRequestHeader.Name, String)>()

    init() {
        headerMock.expect(any())
        addHeaderMock.expect(any())
        setHeaderMock.expect(any())
    }

    convenience init(path: String) {
        self.init()
        self.path = path
    }

    convenience init(method: HTTPMethod) {
        self.init()
        self.method = method
    }

    convenience init(withAuthorization user: User) {
        self.init()

        self.addAuthorization(user: user)
    }

    convenience init(urlVariables: [String: String]) {
        self.init()
        self.urlVariables = urlVariables
    }

    convenience init(urlVariables: [String: String], withAuthorization user: User) {
        self.init()
        self.urlVariables = urlVariables

        self.addAuthorization(user: user)
    }

    func header(_ named: HTTPRequestHeader.Name) -> String? {
        headerMock.record(named)

        var value: String? = nil
        do {
            value = try headerStub.invoke(named)
        } catch {
            print("Stub not exist!")
        }

        return value
    }

    func addHeader(_ named: HTTPRequestHeader.Name, value: String) {
        addHeaderMock.record((named, value))
    }

    func setHeader(_ named: HTTPRequestHeader.Name, value: String) {
        setHeaderMock.record((named, value))
    }

    private func addAuthorization(user: User) {
        let userCredentials = UserCredentials(
            id: user.id,
            name: user.email,
            roles: []
        )
        self.add(userCredentials: userCredentials)
    }
}

extension FakeHTTPRequest {
    func addObjectToRequestBody<T>(_ value: T) where T: SwiftProtobuf.Message {

        do {
            let json = try value.jsonString()
            self.setHeader(.contentType, value: "text/json")
            self.postBodyString = json
        } catch {
            print("Error during converting to JSON.")
        }
    }
}
