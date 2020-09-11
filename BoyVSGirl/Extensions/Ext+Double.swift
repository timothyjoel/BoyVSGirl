//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

extension Double {
    func rounded(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func percentage() -> String {
        return String(format: "%.1f", self) + "%"
    }
    
}
