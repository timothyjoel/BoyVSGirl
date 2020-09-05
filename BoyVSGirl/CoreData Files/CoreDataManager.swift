//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() { }
    
    func add(_ vote: Vote) {
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            os_log(.fault, log: .coreData, "Failed to create App Delegate")
            return
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "DataVote", in: managedContext) else {
            os_log(.fault, log: .coreData, "Failed to create entity: DataVote")
            return
        }
        
        let newVote = NSManagedObject(entity: entity, insertInto: managedContext)
        newVote.setValue(vote.voter, forKey: "voter")
        let selectedVote = vote.vote == .boy ? "boy" : "girl"
        newVote.setValue(selectedVote, forKey: "vote")
        
        do {
            try managedContext.save()
            os_log(.info, log: .coreData, "Saved new vote: Voter - %@, vote - %@", vote.voter, selectedVote)
        } catch {
            os_log(.error, log: .coreData, "Failed to save data")
        }
        
    }
    
}
