//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum Icon {
    
    case menu, back, info, cancel, trash
    
    var name: String {
        switch self {
        case .menu: return "list.dash"
        case .back: return "chevron.left"
        case .info: return "info.circle"
        case .cancel: return "xmark"
        case .trash: return "trash"
        }
    }
    
}
