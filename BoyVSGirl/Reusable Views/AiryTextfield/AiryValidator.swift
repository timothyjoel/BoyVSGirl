//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

protocol AiryValidator {
    
    typealias validationMessage = String
    typealias isValid = Bool
    typealias AiryValidationStatus = (validationMessage, isValid)
    
    /// Returns ValidationStatus in format (validationMessage, isValid)
    func getValidation(of text: String, textfieldDefaultTitle: String) -> AiryValidationStatus
    
}


