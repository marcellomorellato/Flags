//
//  Container.swift
//  Flags
//
//  Created by Marcello on 17/10/22.
//

import Foundation

protocol ContainerProtocol{
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

final class Container:ContainerProtocol{
    static let shared = Container()
    
    private init() {}
    
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
    
}
