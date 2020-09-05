//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct IconView: View {
    
    var name: Icon
    var size: Image.Scale
    var weight: Font.Weight
    var color: Color
    
    var body: some View {
        
        Image(systemName: name.name)
            .font(.system(size: 20, weight: weight))
            .imageScale(size)
            .frame(width: 32, height: 32)
            .foregroundColor(color)
        
    }
    
}
