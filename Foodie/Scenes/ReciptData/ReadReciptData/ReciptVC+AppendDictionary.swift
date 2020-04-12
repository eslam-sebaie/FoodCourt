//
//  ReciptVC+AppendDictionary.swift
//  Foodie
//
//  Created by Eslam Sebaie on 4/12/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
extension Dictionary where Value: RangeReplaceableCollection {
    public mutating func append(element: Value.Iterator.Element, toValueOfKey key: Key) -> Value? {
        var value: Value = self[key] ?? Value()
        value.append(element)
        self[key] = value
        return value
    }
}
