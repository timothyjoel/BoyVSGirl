//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct Vote: Equatable {
    var id = UUID()
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
