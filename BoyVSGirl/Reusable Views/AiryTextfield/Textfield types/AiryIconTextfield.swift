//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryIconTextfield: View, AiryTextfieldProvider, AiryIconProvider {
    
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
    /// Regular textfield icon
    var icon: String
    /// Icon size
    var iconSize: CGFloat
    /// Currently Inserted text
    @Binding var text: String
    /// Indicates whether textfield is currently editing text
    @State var isEditing: Bool = false
    
    init(title: String = "", placeholder: String = "", text: Binding<String>, isValid: Binding<Bool>, mainColor: Color = .darkBlue, secondaryColor: Color = .lightGrey, titleFont: Font = .system(size: 12, weight: .bold, design: .rounded), textFont: Font = .system(size: 16, weight: .bold, design: .rounded), lineHeight: CGFloat = 1, titleUppercased: Bool = false, icon: String, iconSize: CGFloat = 16) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.titleFont = titleFont
        self.font = textFont
        self.lineHeight = lineHeight
        self.titleUppercased = titleUppercased
        self.icon = icon
        self.iconSize = iconSize
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text != "" ? title : "")
                .multilineTextAlignment(.leading)
                .font(titleFont)
                .foregroundColor(isEditing ? mainColor : secondaryColor)
                .animation(.easeInOut)
            HStack (alignment: .center, spacing: 5) {
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(secondaryColor)
                    .frame(width: iconSize, height: iconSize)
                TextField(placeholder, text: self.$text, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .multilineTextAlignment(.leading)
                .font(font)
                .foregroundColor(mainColor)
                .padding(.vertical, 4)
                Spacer()
            }
            HStack {
                Spacer()
            }
            .frame(height: lineHeight)
            .background(secondaryColor)
        }
    }
    
}
