//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct Icon: View {
    
    var name: IconImage
    var color: Color
    var side: CGFloat
    
    init(name: IconImage, color: Color, side: CGFloat = 32) {
        self.name = name
        self.color = color
        self.side = side
    }
    
    var body: some View {
        
        Image(name.name)
            .resizable()
            .frame(width: side, height: side)
            .scaledToFit()
            .foregroundColor(color)
        
    }
    
    enum IconImage {
        
        case menu
        case trash
        
        var name: String {
            switch self {
            case .menu: return "menu"
            case .trash: return "trash"
            }
        }
        
    }
    
}
