//
//  Users+CoreDataProperties.swift
//  CoreData_Starter
//
//  Created by Roh on 2/19/24.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var jokes: [String]?

}

extension Users : Identifiable {

}
