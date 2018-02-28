//
//  GRDBModel.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

open class GRDBModel: Record, Hashable {
    public required override init() {
        super.init()
    }
    
    public required init(row: Row) {
        super.init(row: row)
    }
    
    public var entryId: String = ""
    public var hashValue: Int = 0
    public var databaseName: String = ""
    
    open static func ==(lhs: GRDBModel, rhs: GRDBModel) -> Bool {
        return lhs.entryId == rhs.entryId
    }
    
    open override func encode(to container: inout PersistenceContainer) {
        fatalError("Abstact method")
    }
    
    open override class var databaseTableName: String {
        fatalError("Abstact method")
    }
}

