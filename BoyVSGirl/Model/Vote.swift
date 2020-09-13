//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct Vote: Equatable, Hashable {
    var id = UUID()
    var date = Date()
    var voter: String
    var gender: Gender
}

enum Gender: Int16 {
    
    case boy = 0
    case girl = 1
    
    var asString: String {
        switch self {
        case .boy: return "Boy"
        case .girl: return "Girl"
        }
    }

}
