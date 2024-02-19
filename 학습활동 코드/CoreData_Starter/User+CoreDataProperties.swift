//
//  User+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by Roh on 2/19/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var jokes: [String]?

}

extension User : Identifiable {

}
