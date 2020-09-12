//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

protocol ValidatableTextfield {
    func getValidation(text: String) -> ValidatableStatus
}

protocol ValidatableStatus {
    var isValid: Bool { get }
    var status: String { get }
}

enum ValidationVoterName: ValidatableStatus {
    
    case initial
    case tooShort
    case tooLong
    case valid
    
    var status: String {
        return getValidation().0
    }
    
    var isValid: Bool {
        return getValidation().1
    }
    
    private func getValidation() -> (String, Bool) {
        switch self {
        case .tooLong: return ("The name is too long", false)
        case .tooShort: return ("The name is too short", false)
        case .valid: return ("Your name", true)
        case .initial: return ("", false)
        }
    }
}
