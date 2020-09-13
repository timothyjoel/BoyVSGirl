//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryTextfield: View, AiryTextfieldProvider {
    
    var titleFont: Font
    var textFont: Font
    
    var mainColor: Color
    var secondaryColor: Color
    
    var title: String
    var placeholder: String
    
    var lineHeight: CGFloat
    
    @Binding var text: String
    
    init(title: String, placeholder: String, text: Binding<String>, mainColor: Color = .darkBlue, secondaryColor: Color = .lightGrey, titleFont: Font = .system(size: 12, weight: .bold, design: .rounded), textFont: Font = .system(size: 16, weight: .bold, design: .rounded), lineHeight: CGFloat = 1) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.titleFont = titleFont
        self.textFont = textFont
        self.lineHeight = lineHeight
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                Text(text != "" ? title : "")
                    .multilineTextAlignment(.leading)
                    .font(titleFont)
                    .foregroundColor(secondaryColor)
                    .animation(.easeInOut)
            }
            TextField(placeholder, text: self.$text)
            .multilineTextAlignment(.leading)
            .font(textFont)
            .foregroundColor(.darkBlue)
            .padding(.vertical, 4)
            HStack {
              Spacer()
            }
            .frame(height: lineHeight)
            .background(secondaryColor)
        }
    }
    
}
