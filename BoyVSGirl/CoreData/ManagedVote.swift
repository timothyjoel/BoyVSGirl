//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import CoreData

@objc(ManagedVote) public class ManagedVote: NSManagedObject {
    
    @NSManaged var voter: String
    @NSManaged var gender: Int16
    
    var vote: Vote { Vote(voter: self.voter, gender: Gender(rawValue: self.gender)!) }
    
}

extension ManagedVote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedVote> {
        return NSFetchRequest<ManagedVote>(entityName: ManagedVoteKeys.entityName)
    }

}


enum ManagedVoteKeys {
    
    static let entityName = "ManagedVote"
    static let voter = "voter"
    static let gender = "gender"
    
}
