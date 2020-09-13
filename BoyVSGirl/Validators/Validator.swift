//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

protocol ValidatableTextfieldStatus {
    typealias validationMessage = String
    typealias isValid = Bool
    typealias ValidationStatus = (validationMessage, isValid)
    func getValidation(of text: String, textfieldTitle: String) -> ValidationStatus
}

class NameValidator: ValidatableTextfieldStatus {
    
    func getValidation(of text: String, textfieldTitle: String) -> ValidationStatus {
        switch text.count {
        case 1..<3: return ("Your name is too short", false)
        case let count where count > 15: return ("Your name is too long", false)
        case let count where count == 0: return ("", false)
        default: return (textfieldTitle, true)
        }
    }
    
}
