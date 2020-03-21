//
//  CTUniversalModel.swift
//  CTUniversalModel
//
//  Created by casa on 2020/3/21.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation

public protocol CTUniversalModel {
    func ct_Get<T>(key:String?, defaultValue:T) -> T
}

public extension CTUniversalModel {
    func ct_Get<T>(key:String?, defaultValue:T) -> T {
        for property in Mirror(reflecting: self).children {
            guard let propertyKey = property.label else { continue }
            guard key == propertyKey else { continue }
            if case Optional<Any>.some(let value) = property.value, let result = value as? T {
                return result
            }
        }
        return defaultValue
    }
}
