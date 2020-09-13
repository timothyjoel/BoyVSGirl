//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

protocol AiryValidationProvider {
    var validator: AirTextfieldValidator { get }
    var errorColor: Color { get }
    var isValid: Bool { get set }
}

