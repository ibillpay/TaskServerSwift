//
//  DependencyContainer.swift
//  TaskerServerPackageDescription
//
//  Created by Marcin Czachurski on 12.02.2018.
//

import Foundation
import Dip
import PerfectSQLite

extension DependencyContainer {
    public func configure(withConfiguration configuration: Configuration) {
        self.addConfiguration(toContainer: self, configuration: configuration)
        self.addDatabase(toContainer: self)
        self.addRepositories(toContainer: self)
        self.addServices(toContainer: self)
        self.addControllers(toContainer: self)
    }
    
    public func resolveAllControllers() -> [Controller] {
        let controllers:[Controller] = [
            try! self.resolve() as HealthController,
            try! self.resolve() as TasksController,
            try! self.resolve() as UsersController
        ]
        
        return controllers
    }
    
    private func addDatabase(toContainer container: DependencyContainer) {
        container.register(.singleton) { SQLiteConnection(configuration: $0) as SqlConnectionProtocol }
        container.register { DatabaseContext(sqlConnection: $0) as DatabaseContextProtocol }
    }
    
    private func addConfiguration(toContainer container: DependencyContainer, configuration: Configuration) {
        container.register(.singleton) { configuration }
    }
    
    private func addRepositories(toContainer container: DependencyContainer) {
        container.register { TasksRepository(databaseContext: $0) as TasksRepositoryProtocol }
        container.register { UsersRepository(databaseContext: $0) as UsersRepositoryProtocol }
    }
    
    private func addServices(toContainer container: DependencyContainer) {
        container.register { TasksService(tasksRepository: $0) as TasksServiceProtocol }
        container.register { UsersService(usersRepository: $0) as UsersServiceProtocol }
    }
    
    private func addControllers(toContainer container: DependencyContainer) {
        container.register { TasksController(tasksRepository: $0) }
        container.register { UsersController(usersRepository: $0) }
        container.register { HealthController() }
    }
}

