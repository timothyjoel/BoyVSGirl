//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum Images {
    
    case boy, girl, thermometer
    
    var name: String {
        switch self {
        case .boy: return "baby-boy"
        case .girl: return "baby-girl"
        case .thermometer: return "thermometer"
        }
    }
    
}
