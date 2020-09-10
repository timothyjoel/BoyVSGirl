//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() { }
    
    func save(_ vote: Vote) {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            os_log(.fault, log: .coreData, "Failed to create App Delegate.")
            return
        }
        guard let entity = NSEntityDescription.entity(forEntityName: EntityName.ManagedVote.key, in: managedContext) else {
            os_log(.fault, log: .coreData, "Failed to create entity: %@.", EntityName.ManagedVote.key)
            return
        }
        
        let newVote = NSManagedObject(entity: entity, insertInto: managedContext)
        newVote.setValue(vote.voter, forKey: .voter)
        newVote.setValue(Int16(vote.gender.rawValue), forKey: .gender)
        newVote.setValue(vote.id, forKey: .id)
        newVote.setValue(vote.date, forKey: .date)
        
        do {
            try managedContext.save()
            os_log(.info, log: .coreData, "Saved new vote - %@, voter - %@.", vote.gender.asString, vote.voter)
        } catch let error as NSError {
            os_log(.error, log: .coreData, "Failed to save data, error: %@.", error.localizedDescription)
        }
        
    }
    
    func update(_ vote: Vote, with new: Vote) {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            os_log(.fault, log: .coreData, "Failed to create App Delegate.")
            return
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.ManagedVote.key)
        fetchRequest.predicate = NSPredicate(format: "\(ManagedObjectKey.id) == %@", "\(vote.id)")
        
        do {
            let savedVote = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            savedVote.setValue(new.voter, forKey: .voter)
            savedVote.setValue(new.gender.rawValue, forKey: .gender)
            savedVote.setValue(vote.id, forKey: .id)
            savedVote.setValue(vote.date, forKey: .date)
            do {
                try managedContext.save()
                os_log(.info, log: .coreData, "Updated vote - %@, voter - %@ with vote - %@, voter - %@.", vote.gender.asString, vote.voter, new.gender.asString, new.voter)
            } catch let error as NSError {
                os_log(.error, log: .coreData, "Failed to update data, error: %@.", error.localizedDescription)
            }
        } catch let error as NSError {
            os_log(.error, log: .coreData, "Failed to fetch saved vote - %@, voter - %@, error: %@.", vote.gender.asString, vote.voter, error.localizedDescription)
        }
        
    }
    
    func delete(_ vote: Vote) {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            os_log(.fault, log: .coreData, "Failed to create App Delegate.")
            return
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EntityName.ManagedVote.key)
        fetchRequest.predicate = NSPredicate(format: "\(ManagedObjectKey.id.key) == %@", "\(vote.id)")
        
        do {
            let voteToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(voteToDelete)
            
            do {
                try managedContext.save()
                os_log(.info, log: .coreData, "Deleted vote - %@, voter - %@.", vote.gender.asString, vote.voter)
            } catch let error as NSError {
                os_log(.error, log: .coreData, "Failed to update data, error: %@.", error.localizedDescription)
            }
        } catch let error as NSError {
            os_log(.error, log: .coreData, "Failed to fetch saved vote - %@, voter - %@, error: %@.", vote.gender.asString, vote.voter, error.localizedDescription)
        }
        
    }
    
    func fetchVotes(completion: @escaping ([Vote]) -> Void) {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            os_log(.fault, log: .coreData, "Failed to create App Delegate.")
            return
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityName.ManagedVote.key)
        
        do {
            let fetchedVotes = try managedContext.fetch(fetchRequest) as! [ManagedVote]
            os_log(.info, log: .coreData, "Fetched current votes, count: %@.", "\(fetchedVotes.count)")
            completion(fetchedVotes.compactMap { $0.vote })
        } catch let error as NSError {
            os_log(.error, log: .coreData, "Failed to load data, error: %@.", error.localizedDescription)
        }
        
    }
    
}

extension NSManagedObject {
    
    func setValue(_ value: Any?, forKey key: ManagedObjectKey) {
        setValue(value, forKey: key.key)
    }
 
}
