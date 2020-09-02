//
//  Images.swift
//  BoyVSGirl
//
//  Created by Timothy Stokarski on 05/08/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum Images {
    
    case boy
    case girl
    case footprint
    
    var image: String {
        switch self {
        case .boy: return "baby-boy"
        case .girl: return "baby-girl"
        case .footprint: return "footprint"
        }
    }
}
