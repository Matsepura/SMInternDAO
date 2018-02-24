//
//  GRDBConfiguration.swift
//  SMInternDAO
//
//  Created by Semen Matsepura on 24.02.2018.
//  Copyright © 2018 Semen Matsepura. All rights reserved.
//

import Foundation
import GRDB

public struct CoreDataConfiguration {
    
    /// Database path
    public let pathName: String
    
    /// SQLite creates the database file if it does not already exist.
    /// The connection is closed when the database queue gets deallocated.
    var dbQueue: DatabaseQueue? {
        let queue = try? DatabaseQueue(path: pathName)
        return queue
    }
    
    /// A database queue can be used from any thread.
    let inMemoryDBQueue = DatabaseQueue()
    
    public init(pathName: String) {
        self.pathName = pathName
    }
}
