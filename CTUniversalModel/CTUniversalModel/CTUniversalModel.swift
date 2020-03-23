//
//  CTUniversalModel.swift
//  CTUniversalModel
//
//  Created by casa on 2020/3/21.
//  Copyright © 2020 casa. All rights reserved.
//

import Foundation

public class CTUniversalModel {
    var data:[AnyHashable:Any] = [:]

    public func get<T>(key:String?, defaultValue:T) -> T {
        guard let key = key else { return defaultValue }
        if let item = data[key] as? T {
            return item
        }
        return defaultValue
    }

    public func set<T>(key:String?, value:T) {
        data[key] = value
    }

    public func remove(key:String?) {
        data.removeValue(forKey: key)
    }
}
