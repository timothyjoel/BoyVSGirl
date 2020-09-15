//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

protocol AiryTextfieldProvider {
    var title: String { get }
    var placeholder: String { get }
    var titleFont: Font { get }
    var font: Font { get }
    var textColor: Color { get }
    var secondaryColor: Color { get }
    var text: String { get set }
    var lineHeight: CGFloat { get }
    var titleUppercased: Bool { get }
}
