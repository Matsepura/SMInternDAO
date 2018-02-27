//
//  SQLiteSwiftDAO.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import SQLite

open class SQLiteSwiftDAO {
    open let db: Connection
    open let table: Table
    
    public init(db: Connection,
                table: Table) {
        self.db = db
        self.table = table
    }
    
    open func erase() throws {
        try delete()
    }
    
    private func delete() throws {
        try db.run(table.delete())
    }
}
