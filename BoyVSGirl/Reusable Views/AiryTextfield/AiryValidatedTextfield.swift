//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryValidatedTextfield: View, AiryTextfieldProvider, AiryValidationProvider {
    
    var titleFont: Font
    var textFont: Font
    
    var mainColor: Color
    var secondaryColor: Color
    var errorColor: Color
    
    var title: String
    var validator: AiryTextfieldValidator
    var placeholder: String
    
    var lineHeight: CGFloat
    
    @State var titleMessage: String = ""
    @Binding var isValid: Bool
    @Binding var text: String
    
    init(title: String, placeholder: String, text: Binding<String>, isValid: Binding<Bool>, validator: AiryTextfieldValidator, mainColor: Color = .darkBlue, secondaryColor: Color = .lightGrey, errorColor: Color = .watermelon, titleFont: Font = .system(size: 12, weight: .bold, design: .rounded), textFont: Font = .system(size: 16, weight: .bold, design: .rounded), lineHeight: CGFloat = 1) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self._isValid = isValid
        self.validator = validator
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.errorColor = errorColor
        self.titleFont = titleFont
        self.textFont = textFont
        self.lineHeight = lineHeight
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                Text(titleMessage)
                    .multilineTextAlignment(.leading)
                    .font(titleFont)
                    .foregroundColor((self.isValid || self.text == "") ? secondaryColor : errorColor)
                    .animation(.easeInOut)
            }
            TextField(placeholder, text: self.$text)
            .onReceive(Just(text)) { (insertedText) in
                let validation = self.validator.getValidation(of: insertedText, textfieldTitle: self.title)
                self.titleMessage = validation.0.uppercased()
                self.isValid = validation.1
            }
            .multilineTextAlignment(.leading)
            .font(textFont)
            .foregroundColor(.darkBlue)
            .padding(.vertical, 4)
            HStack {
              Spacer()
            }
            .frame(height: lineHeight)
            .background((self.isValid || self.text == "") ? secondaryColor : errorColor)
        }
    }
    
}
