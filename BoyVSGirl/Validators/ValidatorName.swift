//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct ValidatorName: AiryValidator {
    
    func getValidation(of text: String, textfieldTitle: String) -> AiryValidationStatus {
        switch text.count {
        case 1..<3: return ("Your name is too short", false)
        case let count where count > 15: return ("Your name is too long", false)
        case let count where count == 0: return ("", false)
        default: return (textfieldTitle, true)
        }
    }
    
}
