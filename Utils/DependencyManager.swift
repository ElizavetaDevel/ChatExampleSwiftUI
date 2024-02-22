//
//  DependencyManager.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import Foundation
import Swinject

class DependencyManager {
    
    //MARK: - Properties
    
    static let shared = DependencyManager()

    private let container = Container()
    
    //MARK: - Initialization
    
    private init() {}
    
    //MARK: - Metods
    
    func registerOnAppStart() {
        registerService(MessageService.self) { _ in
            MockMessageService()
        }
    }

    func registerService<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) {
        container.register(serviceType) { resolver in
            factory(resolver)
        }
        .inObjectScope(.container)
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }
    
}

