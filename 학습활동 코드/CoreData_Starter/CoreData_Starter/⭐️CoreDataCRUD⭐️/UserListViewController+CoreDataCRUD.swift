//
//  UserListViewController+CoreDataCRUD.swift
//  CoreData_Starter
//

import Foundation
import CoreData

//MARK: - ⭐️ CoreData CURD 구현하기 ⭐️
extension UserListViewController: CoreDataManagable {
    
    func saveCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData에 User data를 저장하세요.
        // ---------------------------------------------------------------------------------------------------------//
        if let context = context,
           let entity: NSEntityDescription
            = NSEntityDescription.entity(forEntityName: modelName, in: context) {
            
            if let user: Users = NSManagedObject(entity: entity, insertInto: context) as? Users {
                user.id = data.id
                user.name = data.name
            }
        }
    }
    
       
    
    func fetchCoreData() -> [User] {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 모든 User data를 가져오세요.
        // ---------------------------------------------------------------------------------------------------------//
        
        var users: [User] = []
        
        if let context = context {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
            do {
                if let fetchData = try context.fetch(request) as? [Users] {
                    users = fetchData.map { result in
                        return User(id: result.id ?? UUID(), name: result.name ?? "", jokes: [result.jokes as AnyObject as! Joke])
                    }
                }
            } catch {
                    
            }
        }
        return users
//        return User.sampleUsers // 샘플 데이터입니다. CoreData에서 받아올 수 있도록 변경해보세요.
    }
    
    func updateCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 업데이트하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
    }
    
    func deleteCoreData(_ data: User) {
        // ---------------------------------------------------------------------------------------------------------//
        // 이 곳에서 CoreData의 특정 User data를 삭제하세요.
        // ---------------------------------------------------------------------------------------------------------//
        
    }
}
