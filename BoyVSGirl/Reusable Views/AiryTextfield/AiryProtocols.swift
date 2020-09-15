//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

protocol AiryValidator {
    typealias validationMessage = String
    typealias isValid = Bool
    typealias AiryValidationStatus = (validationMessage, isValid)
    /// Returns ValidationStatus in format (validationMessage, isValid)
    func getValidation(of text: String, textfieldTitle: String) -> AiryValidationStatus
}

protocol AiryTextfieldProvider {
    var title: String { get }
    var placeholder: String { get }
    var titleFont: Font { get }
    var font: Font { get }
    var mainColor: Color { get }
    var secondaryColor: Color { get }
    var text: String { get set }
    var lineHeight: CGFloat { get }
    var titleUppercased: Bool { get }
    var isEditing: Bool { get set }
}

protocol AiryValidationProvider {
    var validationMessage: String { get set }
    var validator: AiryValidator { get }
    var errorColor: Color { get }
    var isValid: Bool { get set }
}

protocol AiryIconProvider {
    var iconSize: CGFloat { get }
    var icon: String { get }
}

protocol AiryErrorIconProvider  {
    var errorIcon: String { get }
}


