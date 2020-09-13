//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

protocol AiryValidationProvider {
    var titleMessage: String { get set }
    var validator: AiryTextfieldValidator { get }
    var errorColor: Color { get }
    var isValid: Bool { get set }
}

