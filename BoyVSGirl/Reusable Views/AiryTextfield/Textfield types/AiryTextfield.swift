//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryTextfield: View, AiryTextfieldProvider {
    
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
    var mainColor: Color
    /// Color for title and line
    var secondaryColor: Color
    /// Currently Inserted text
    @Binding var text: String
    /// Indicates whether textfield is currently editing text
    @State var isEditing: Bool = false
    
    init(title: String, placeholder: String, text: Binding<String>, mainColor: Color = .darkBlue, secondaryColor: Color = .lightGrey, titleFont: Font = .system(size: 12, weight: .bold, design: .rounded), textFont: Font = .system(size: 16, weight: .bold, design: .rounded), lineHeight: CGFloat = 1, titleUppercased: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.titleFont = titleFont
        self.font = textFont
        self.lineHeight = lineHeight
        self.titleUppercased = titleUppercased
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text != "" ? title : "")
                .multilineTextAlignment(.leading)
                .font(titleFont)
                .foregroundColor(isEditing ? mainColor : secondaryColor)
                .animation(.easeInOut)
            TextField(self.placeholder, text: self.$text, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
            })
                .multilineTextAlignment(.leading)
                .font(font)
                .foregroundColor(mainColor)
                .padding(.vertical, 4)
            HStack {
                Spacer()
            }
            .frame(height: lineHeight)
            .background(isEditing ? mainColor : secondaryColor)
        }
    }
    
}
