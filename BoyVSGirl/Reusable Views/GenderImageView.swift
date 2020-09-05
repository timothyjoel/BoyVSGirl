//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct GenderImageView: View {
    
    var gender: Images
    
    init(_ gender: Images) {
        self.gender = gender
    }
    
    var body: some View {
        Image(gender.name)
            .resizable()
            .frame(width: UIScreen.height/7, height: UIScreen.height/7, alignment: .center)
            .scaledToFit()
    }
}
