//
//  SQLiteSwiftDAO.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import SQLite

open class SQLiteSwiftDAO<Model: Entity, DBModel: SQLiteSwiftModel>: DAO<Model>  {
    private let db: Connection
    private let table: Table
    private let translator: SQLiteSwiftTranslator<Model, DBModel>
    
    public init(db: Connection,
                table: Table,
                translator: SQLiteSwiftTranslator<Model, DBModel>) {
        self.db = db
        self.table = table
        self.translator = translator
    }
    
    override open func erase() throws {
        try delete()
    }
    
//    // MARK: - Private
//    private func write(_ entry: DBModel) throws {
//        db.run(table.insert(entry))
//    }
//
//    private func write(_ entries: [DBModel]) throws {
//        db.inDatabase { (db)  in
//            entries.forEach({
//                try? $0.save(db)
//            })
//        }
//    }
//
//    private func fetch() -> [DBModel] {
//        var array: [DBModel] = []
//        _ = db.inDatabase { (db) in
//            if let dbArray = try? DBModel.fetchAll(db) {
//                array = dbArray
//            }
//        }
//        return array
//    }
//
    private func delete() throws {
       try db.run(table.delete())
    }
}

