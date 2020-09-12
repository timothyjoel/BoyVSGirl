//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct IconView: View {
    
    var name: Icon
    var color: Color
    
    var body: some View {
        
        Image(name.name)
            .resizable()
            .frame(width: 32, height: 32)
            .scaledToFit()
            .foregroundColor(color)
        
    }
    
}

enum Icon {
    
    case menu
    case trash
    
    var name: String {
        switch self {
        case .menu: return "menu"
        case .trash: return "trash"
        }
    }
    
}
