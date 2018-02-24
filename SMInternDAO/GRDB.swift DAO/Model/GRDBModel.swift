//
//  GRDBModel.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

public class GRDBModel: RowConvertible, Hashable {
    public required init(row: Row) {
        fatalError("Abstact method")
    }
    
    public var hashValue: Int = 0
    
    public static func ==(lhs: GRDBModel, rhs: GRDBModel) -> Bool {
        // TODO: - хз что это - почитать и доделать
        return true
    }
}

// Persistable vs MutablePersistable ?
extension GRDBModel: MutablePersistable {
    public func encode(to container: inout PersistenceContainer) {
        fatalError("Abstact method")
    }
    
    public static var databaseTableName: String {
        fatalError("Abstact method")
    }
}
