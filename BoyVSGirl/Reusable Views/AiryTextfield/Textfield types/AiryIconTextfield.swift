//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct AiryIconTextfield: View {

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
    
    // MARK: - Icon variables
    private var icon: String
    @State private var iconSize: CGFloat = 16
    @State private var iconRenderingMode: Image.TemplateRenderingMode? = .template
    @State private var iconPosition: IconPosition = .leading
    
    init(title: String = "", placeholder: String = "", text: Binding<String>, icon: String) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.icon = icon
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text != "" ? title : "")
                .multilineTextAlignment(.leading)
                .font(titleFont)
                .foregroundColor(isEditing ? mainColor : secondaryColor)
                .animation(.easeInOut)
            HStack (alignment: .center, spacing: 5) {
                if iconPosition == .leading {
                    Image(icon)
                        .renderingMode(iconRenderingMode)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(secondaryColor)
                        .frame(width: iconSize, height: iconSize)
                }
                TextField(placeholder, text: self.$text, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .multilineTextAlignment(.leading)
                .font(font)
                .foregroundColor(mainColor)
                .padding(.vertical, 4)
                if iconPosition == .trailing {
                    Image(icon)
                        .renderingMode(iconRenderingMode)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(secondaryColor)
                        .frame(width: iconSize, height: iconSize)
                }
            }
            HStack {
                Spacer()
            }
            .frame(height: lineHeight)
            .background(secondaryColor)
        }
    }
    
}

extension AiryIconTextfield {
    
    enum IconPosition {
        case leading
        case trailing
    }
}

extension AiryIconTextfield {
    
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
    
    // MARK: - Icon methods
    /// Defines the icon color
    @inlinable func iconRenderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> some View {
        let textfield = self
        textfield.iconRenderingMode = renderingMode
        return textfield
    }
    
    /// Defines whether title above textfield is uppercased
    @inlinable func iconSize(_ size: CGFloat) -> some View {
        let textfield = self
        textfield.iconSize = size
        return textfield
    }
    
    /// Defines whether icon should be set on leading or trailing side off the view
    @inlinable func iconPosition(_ position: IconPosition) -> some View {
        let textfield = self
        textfield.iconPosition = position
        return textfield
    }
    
}
