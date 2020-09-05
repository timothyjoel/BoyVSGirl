//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct Vote: Equatable {
    var voter: String
    var vote: Gender
}

enum Gender {
    case boy, girl
}
