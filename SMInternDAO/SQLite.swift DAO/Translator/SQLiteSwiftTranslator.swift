//
//  SQLiteSwiftTranslator.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation

/// Parent class for `SQLite.swift` translators.
/// Translators fill properties of new/existant entities from entries and other way.
open class SQLiteSwiftTranslator<Model: Entity, DBModel: SQLiteSwiftModel> {
    
    open var entryClassName: String {
        return NSStringFromClass(DBModel.self).components(separatedBy: ".").last!
    }
    
    required public init() { }
    
    open func fill(_ entity: Model, fromEntry: DBModel) {
        fatalError("Abstact method")
    }
    
    open func fill(_ entry: DBModel, fromEntity: Model, in context: GRDBModel) {
        fatalError("Abstact method")
    }

    open func fill(_ entry: DBModel, fromEntity: Model) {
        fatalError("Abstact method")
    }
    
    open func fill(_ entries: inout [DBModel], fromEntities: [Model]) {
        var newEntries = [DBModel]()
        
        fromEntities
            .map { entity -> (DBModel, Model) in
                
                let entry = entries
                    .filter { $0.entryId == entity.entityId }
                    .first
                
                if let entry = entry {
                    return (entry, entity)
                } else {
                    let entry = DBModel()
                    newEntries.append(entry)
                    return (entry, entity)
                }
            }
            .forEach {
                self.fill($0.0, fromEntity: $0.1)
        }
        
        if fromEntities.count < entries.count {
            let entityIds = fromEntities.map { $0.entityId }
            let deletedEntriesIndexes = entries
                .filter { !entityIds.contains($0.entryId) }
            deletedEntriesIndexes.forEach {
                if let index = entries.index(of: $0) {
                    entries.remove(at: index)
                }
            }
        } else {
            entries.append(contentsOf: newEntries)
        }
    }
    
    open func fill(_ entities: inout [Model], fromEntries: Set<DBModel>?) {
        entities.removeAll()
        
        fromEntries?.forEach {
            let model = Model()
            entities.append(model)
            self.fill(model, fromEntry: $0)
        }
    }
}
