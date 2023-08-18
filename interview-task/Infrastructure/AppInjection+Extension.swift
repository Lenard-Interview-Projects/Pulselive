//
//  AppInjection+Extension.swift
//  interview-task
//
//  Created by Lenard Pop on 13/08/2023.
//

import Foundation
import Resolver
import interview_services

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerItemsServices()
    }
}

extension Resolver {
    public static func registerItemsServices() {
        register { ItemsServices() }
            .implements(ItemsServicesProtocol.self)
            .scope(.application)
    }
}
