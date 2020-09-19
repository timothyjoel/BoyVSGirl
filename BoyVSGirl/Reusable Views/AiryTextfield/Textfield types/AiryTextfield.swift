//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryTextfield: View {
    
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
    
    init(title: String, placeholder: String, text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text != "" ? title : "")
                .multilineTextAlignment(titleAlignment)
                .font(titleFont)
                .foregroundColor(isEditing ? mainColor : secondaryColor)
                .animation(.easeInOut)
            TextField(self.placeholder, text: self.$text, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
            })
                .multilineTextAlignment(textAlignment)
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

extension AiryTextfield {
    
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
    
}
