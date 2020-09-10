//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class Validator {
    
    static func validate(_ voter: String) -> ValidationStatus {
        switch voter.count {
        case 1..<3: return .tooShort
        case let count where count > 15: return .tooLong
        case let count where count == 0: return .noValue
        default: return .valid
        }
    }
    
}

extension Validator {
    
    enum ValidationStatus {
        
        case noValue
        case tooShort
        case tooLong
        case valid
        
        var placeholder: String {
            switch self {
            case .tooLong: return "Voter name is too long"
            case .tooShort: return "Voter name is too short"
            case .noValue, .valid: return "Enter voter name"
            }
        }
    }
    
}
