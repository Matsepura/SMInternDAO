//
//  SQLiteSwiftModel.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 27.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import SQLite

open class SQLiteSwiftModel: Hashable {
    public required init() {}
    
    public var entryId: String = ""
    
    public enum BaseColumns {
        static let entryId = Expression<String>("entryId")
    }
    
    public static func ==(lhs: SQLiteSwiftModel, rhs: SQLiteSwiftModel) -> Bool {
        return lhs.entryId == rhs.entryId
    }
    
    public var hashValue: Int = 0
}
