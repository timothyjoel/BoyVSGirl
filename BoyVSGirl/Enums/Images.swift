//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum Images {
    
    case boy, girl, thermometer, gender
    
    var name: String {
        switch self {
        case .boy: return "baby-boy"
        case .girl: return "baby-girl"
        case .thermometer: return "thermometer"
        case .gender: return "gender"
        }
    }
    
}
