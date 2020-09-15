//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryValidatedTextfield: View, AiryTextfieldProvider, AiryValidationProvider {

    // MARK: - Properties
    /// Placeholder for textfield
    var placeholder: String
    /// Title displayed above the textfield
    var title: String
    /// Font for title above the textfield
    var titleFont: Font
    /// Should title be uppercased
    var titleUppercased: Bool
    /// Font for textfield text
    var font: Font
    /// Height of line under textfield
    var lineHeight: CGFloat
    /// Color for text
    var textColor: Color
    /// Color for title and line
    var secondaryColor: Color
    /// Color for title and line when validation is not passed
    var errorColor: Color
    /// Textfield's validator
    var validator: AiryTextfieldValidator
    /// Indiactor whether input is valid
    @Binding var isValid: Bool
    /// Validation message displayed as replacement for title
    @State var validationMessage: String = ""
    /// Currently Inserted text
    @Binding var text: String
    
    // MARK: - Initializers
    init(title: String = "", placeholder: String = "", text: Binding<String>, isValid: Binding<Bool>, validator: AiryTextfieldValidator, mainColor: Color = .darkBlue, secondaryColor: Color = .lightGrey, errorColor: Color = .watermelon, titleFont: Font = .system(size: 12, weight: .bold, design: .rounded), textFont: Font = .system(size: 16, weight: .bold, design: .rounded), lineHeight: CGFloat = 1, titleUppercased: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self._isValid = isValid
        self.validator = validator
        self.textColor = mainColor
        self.secondaryColor = secondaryColor
        self.errorColor = errorColor
        self.titleFont = titleFont
        self.font = textFont
        self.lineHeight = lineHeight
        self.titleUppercased = titleUppercased
    }
    
    // MARK: - View
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(validationMessage)
                .multilineTextAlignment(.leading)
                .font(titleFont)
                .foregroundColor((self.isValid || self.text == "") ? secondaryColor : errorColor)
                .animation(.easeInOut)
            TextField(placeholder, text: self.$text)
                .onReceive(Just(text)) { (insertedText) in
                    let validation = self.validator.getValidation(of: insertedText, textfieldTitle: self.title)
                    self.validationMessage = validation.0.uppercased()
                    self.isValid = validation.1
            }
            .multilineTextAlignment(.leading)
            .font(font)
            .foregroundColor(textColor)
            .padding(.vertical, 4)
            HStack {
                Spacer()
            }
            .frame(height: lineHeight)
            .background((self.isValid || self.text == "") ? secondaryColor : errorColor)
        }
    }
    
}
