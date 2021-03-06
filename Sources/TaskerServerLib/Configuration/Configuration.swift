//
//  Configuration.swift
//  TaskerServerLib
//
//  Created by Marcin Czachurski on 17.02.2018.
//

import Foundation
import Configuration

public class Configuration {
    public var serverName: String
    public var serverPort: UInt16
    public var logFile: String
    public var connectionString: String
    public var secret: String
    public var issuer: String

    init(manager: ConfigurationManager) {
        self.serverName = manager["serverName"] as? String ?? ""
        self.serverPort = manager["serverPort"] as? UInt16 ?? 0
        self.logFile = manager["logFile"] as? String ?? ""
        self.connectionString = manager["connectionString"] as? String ?? ""
        self.secret = manager["secret"] as? String ?? ""
        self.issuer = manager["issuer"] as? String ?? ""
    }
}
