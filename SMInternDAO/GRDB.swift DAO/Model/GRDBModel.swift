//
//  GRDBModel.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

open class GRDBModel: RowConvertible, Hashable, MutablePersistable {
    public required init(row: Row) {
        fatalError("Abstact method")
    }
    
    public required init(entryId: String,
                         row: Row) {
        fatalError("Abstact method")
    }
    
    public var entryId: String
    public var hashValue: Int = 0
    public var databaseName: String
    
    open static func ==(lhs: GRDBModel, rhs: GRDBModel) -> Bool {
        // TODO: - хз что это - почитать и доделать
        // https://stackoverflow.com/questions/40713057/strange-behaviour-on-implementing-equatable-on-generic-struct-in-swift
        return lhs.entryId == rhs.entryId
    }
    
    open func encode(to container: inout PersistenceContainer) {
        fatalError("Abstact method")
    }
    
    open class var databaseTableName: String {
        fatalError("Abstact method")
    }
}
