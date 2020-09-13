//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct ValidatedTextfield: View {

    @State private var selectedTitleColor: Color = .darkBlue
    @State private var selectedLineColor: Color = .darkGrey

    @State private var titleFont: Font = .system(size: 12, weight: .bold, design: .rounded)
    @State private var textFont: Font = .system(size: 16, weight: .bold, design: .rounded)
    
    @State private var titleColor: Color = .lightGrey
    @State private var lineColor: Color = .lightGrey
    
    @State private var validColor: Color = .lightGrey
    @State private var errorColor: Color = .watermelon
    @State private var lineHeight: CGFloat = 1

    var title: String
    var validator: ValidatableStatus
    var placeholder: String
    
    @State var titleMessage: String = ""
    @Binding var isValid: Bool
    @Binding var text: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                Text(titleMessage)
                    .multilineTextAlignment(.leading)
                    .font(titleFont)
                    .foregroundColor(titleColor)
                    .animation(.easeInOut)
            }
            TextField(placeholder, text: self.$text)
            .onReceive(Just(text)) { (insertedText) in
                let validation = self.validator.getValidation(of: insertedText, textfieldTitle: self.title)
                self.titleMessage = validation.0
                self.isValid = validation.1
                self.titleColor = self.isValid ? self.validColor : self.errorColor
                self.lineColor = self.isValid ? self.validColor : self.errorColor
            }
            .multilineTextAlignment(.leading)
            .font(textFont)
            .foregroundColor(.darkBlue)
            .padding(.vertical, 4)
            HStack {
              Spacer()
            }
            .frame(height: lineHeight)
            .background(lineColor)
        }
    }
    
}
