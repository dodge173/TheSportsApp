//
//  CoreDataManager.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import UIKit
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetch<T: NSManagedObject>(Entity: T.Type , completion: @escaping ([T]) -> Void) {
        do {
            guard let result = try context.fetch(Entity.fetchRequest()) as? [T] else {
                return
            }
            completion(result)
        } catch {
            //
        }
    }
    
    func delete<T: NSManagedObject>(Entity: T.Type, delete: T) {
        context.delete(delete.self)
        do {
            try context.save()
        } catch {
            //
        }
    }

}
