//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import CoreData

@objc(ManagedVote) public class ManagedVote: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var voter: String
    @NSManaged var gender: Int16
    @NSManaged var date: Date
    
    var vote: Vote {
        Vote(id: self.id, date: self.date, voter: self.voter, gender: Gender(rawValue: gender)!)
    }
    
}

extension ManagedVote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedVote> {
        return NSFetchRequest<ManagedVote>(entityName: EntityName.ManagedVote.key)
    }

}


enum ManagedObjectKey {
    
    case entityName
    case voter
    case gender
    case id
    case date
    
    var key: String {
        switch self {
        case .entityName: return "ManagedVote"
        case .voter: return "voter"
        case .gender: return "gender"
        case .id: return "id"
        case .date: return "date"
        }
    }
    
}

enum EntityName {
    
    case ManagedVote
    
    var key: String {
        switch self {
        case .ManagedVote: return "ManagedVote"
        }
    }
    
}
