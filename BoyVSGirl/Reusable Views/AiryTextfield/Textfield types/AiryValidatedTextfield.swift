//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryValidatedTextfield: View {

    // MARK: - Standard AiryTextfield variables
    private var placeholder: String
    private var title: String
    @Binding private var text: String
    @State private var titleFont: Font = .system(size: 12, weight: .bold, design: .rounded)
    @State private var titleUppercased: Bool = false
    @State private var font: Font = .system(size: 16, weight: .bold, design: .rounded)
    @State private var lineHeight: CGFloat = 1
    @State private var mainColor: Color = .darkBlue
    @State private var secondaryColor: Color = .lightGrey
    @State private var isEditing: Bool = false
    @State private var textAlignment: TextAlignment = .leading
    @State private var titleAlignment: TextAlignment = .leading
    
    // MARK: - Validation variables
    private var validator: AiryValidator
    @Binding private var isValid: Bool
    @State private var validationMessage: String = ""
    @State private var errorColor: Color = .red
    @State private var isSecureEntry: Bool = false
    
    // MARK: - Initializer
    init(title: String = "", placeholder: String = "", text: Binding<String>, isValid: Binding<Bool>, validator: AiryValidator) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self._isValid = isValid
        self.validator = validator
    }
    
    // MARK: - View
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(titleUppercased ? validationMessage.uppercased() : validationMessage)
                .multilineTextAlignment(.leading)
                .font(titleFont)
                .foregroundColor((self.isValid || self.text == "") ? (self.isEditing ? mainColor : secondaryColor) : errorColor)
                .animation(nil)
            TextField(placeholder, text: self.$text, onEditingChanged: { isEditing in
                self.isEditing = isEditing
            })
                .onReceive(Just(text)) { (insertedText) in
                    let validation = self.validator.getValidation(of: insertedText, textfieldDefaultTitle: self.title)
                    self.validationMessage = validation.0
                    self.isValid = validation.1
            }
            .multilineTextAlignment(.leading)
            .font(font)
            .foregroundColor(isValid ? mainColor : errorColor)
            .padding(.vertical, 4)
            HStack {
                Spacer()
            }
            .frame(height: lineHeight)
            .background((self.isValid || self.text == "") ? (self.isEditing ? mainColor : secondaryColor) : errorColor)
        }
    }
    
}

extension AiryValidatedTextfield {
    
    // MARK: - Standard methods
    /// Color of text input
    @inlinable func mainColor(_ color: Color) -> some View {
        let textfield = self
        textfield.mainColor = color
        return textfield
    }
    
    /// Default color of title and line when not selected
    @inlinable func secondaryColor(_ color: Color) -> some View {
        let textfield = self
        textfield.secondaryColor = color
        return textfield
    }
    
    /// Font of title above textfield
    @inlinable func titleFont(_ font: Font) -> some View {
        let textfield = self
        textfield.titleFont = font
        return textfield
    }
    
    /// Height of line under textfield
    @inlinable func lineHeight(_ height: CGFloat) -> some View {
        let textfield = self
        textfield.lineHeight = height
        return textfield
    }
    
    /// Defines whether title above textfield is uppercased
    @inlinable func titleUppercased(_ bool: Bool) -> some View {
        let textfield = self
        textfield.titleUppercased = bool
        return textfield
    }
    
    /// Defines alignment of title
    @inlinable func titleAlignment(_ alignment: TextAlignment) -> some View {
        let textfield = self
        textfield.titleAlignment = alignment
        return textfield
    }
    
    /// Defines alignment of text input
    @inlinable func textAlignment(_ alignment: TextAlignment) -> some View {
        let textfield = self
        textfield.textAlignment = alignment
        return textfield
    }
    
    // MARK: - Validation methods
    /// Error color of textfield components when validation fails
    @inlinable func errorColor(_ color: Color) -> some View {
        let textfield = self
        textfield.errorColor = color
        return textfield
    }
    
    /// Sets textfield input as secured
    @inlinable func isSecuredEntry(_ bool: Bool) -> some View {
        let textfield = self
        textfield.isSecureEntry = bool
        return textfield
    }
    
}
