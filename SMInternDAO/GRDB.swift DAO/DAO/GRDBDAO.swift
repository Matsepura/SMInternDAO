//
//  GRDBDAO.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

/// Parent class for `GRDB.swift` translators.
/// Translators fill properties of new/existant entities from entries and other way.
open class CoreDataTranslator<DBModel: GRDBModel, Model: Entity> {
    
    /// Helper property for `GRDB.swiftDAO`.
    open var entryClassName: String {
        return NSStringFromClass(DBModel.self).components(separatedBy: ".").last!
    }
    
    
    /// Creates an instance of class.
    required public init() { }
    
    
    /// All properties of entity will be overridden by entry properties.
    ///
    /// - Parameters:
    ///   - entity: instance of `Model` type.
    ///   - fromEntry: instance of `CDModel` type.
    open func fill(_ entity: Model, fromEntry: DBModel) {
        fatalError("Abstact method")
    }
    
    
    /// All properties of entry will be overridden by entity properties.
    ///
    /// - Parameters:
    ///   - entry: instance of `DBModel` type.
    ///   - fromEntity: instance of `Model` type.
    ///   - context: managed object context for current transaction.
    open func fill(_ entry: DBModel, fromEntity: Model, in context: GRDBModel) {
        fatalError("Abstact method")
    }
    
    /// All properties of entries will be overridden by entities properties.
    ///
    /// - Parameters:
    ///   - entities: array of instances of `DBModel` type.
    ///   - fromEntries: array of instances of `DBModel` type.
    open func fill(_ entities: inout [Model], fromEntries: Set<DBModel>?) {
        entities.removeAll()
        
        fromEntries?.forEach {
            let model = Model()
            entities.append(model)
            self.fill(model, fromEntry: $0)
        }
    }
}
