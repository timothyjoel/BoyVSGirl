//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

protocol AiryTextfieldValidator {
    typealias validationMessage = String
    typealias isValid = Bool
    typealias AiryValidationStatus = (validationMessage, isValid)
    func getValidation(of text: String, textfieldTitle: String) -> AiryValidationStatus
}
