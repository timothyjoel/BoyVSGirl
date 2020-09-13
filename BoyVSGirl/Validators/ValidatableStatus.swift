//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

protocol AirTextfieldValidationStatus {
    typealias validationMessage = String
    typealias isValid = Bool
    typealias ValidationStatus = (validationMessage, isValid)
    func getValidation(of text: String, textfieldTitle: String) -> ValidationStatus
}
