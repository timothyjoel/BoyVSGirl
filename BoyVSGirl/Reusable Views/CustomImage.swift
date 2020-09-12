//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct CustomImage: View {
    
    var image: ImageName
    
    enum ImageName {
        
        case avatar, folder, gender, pacifier, stroller
        
        var name: String {
            switch self {
            case .avatar: return "avatar"
            case .folder: return "folder"
            case .pacifier: return "pacifier"
            case .gender: return "gender"
            case .stroller: return "stroller"
            }
        }
        
    }
    
    var body: some View {
        Image(image.name)
        .resizable()
        .scaledToFit()
    }
    
}
