//
//  JokeMO+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by Roh on 2/19/24.
//
//

import Foundation
import CoreData


extension JokeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JokeMO> {
        return NSFetchRequest<JokeMO>(entityName: "Joke")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var content: String?
    @NSManaged public var category: String?

}

extension JokeMO : Identifiable {

}
