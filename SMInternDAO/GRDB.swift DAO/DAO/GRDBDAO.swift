//
//  GRDBDAO.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

open class GRDBDAO<Model: Entity, DBModel: GRDBModel>: DAO<Model>  {
    
    private let db: DatabaseQueue
    private let translator: GRDBTranslator<Model, DBModel>
    
    public init(db: DatabaseQueue,
                translator: GRDBTranslator<Model, DBModel>) {
        self.db = db
        self.translator = translator
    }
    
    //MARK: - DAO
    override open func persist(_ entity: Model) throws {
        let entry = DBModel(row: Row())
        translator.fill(entry, fromEntity: entity)
        try? write(entry)
    }
    
    open override func persist(_ entities: [Model]) throws {
        var entries: [DBModel] = []
        translator.fill(&entries, fromEntities: entities)
        try? write(entries)
    }
    
    open override func read() -> [Model] {
        return fetch().map {
            let entity = Model()
            self.translator.fill(entity, fromEntry: $0)
            return entity
        }
    }
    
    override open func erase() throws {
        delete()
    }
    
    // MARK: - Private
    private func write(_ entry: DBModel) throws {
        db.inDatabase { (db) in
            var entry = entry
            try? entry.save(db)
        }
    }
    
    private func write(_ entries: [DBModel]) throws {
        db.inDatabase { (db)  in
            entries.forEach({
                var entry = $0
                try? entry.save(db)
            })
        }
    }
    
    private func fetch() -> [DBModel] {
        var array: [DBModel] = []
        _ = db.inDatabase { (db) in
            if let dbArray = try? DBModel.fetchAll(db) {
                array = dbArray
            }
        }
        return array
    }

    private func delete() {
        _ = db.inDatabase { (db) in
            try? DBModel.deleteAll(db)
        }
    }
}
