//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct NameTextfield: View, ValidatableTextfield {
    
    @State var status: String = ""
    @Binding var isValid: Bool
    @Binding var text: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            VStack {
                Text(status)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(isValid ? .darkBlue : .red)
                    .animation(nil)
            }
            TextField("Enter your name", text: self.$text).onReceive(Just(text)) { (insertedText) in
                let validation = self.getValidation(text: insertedText)
                self.status = validation.status
                self.isValid = validation.isValid
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.darkBlue)
        }
    }
    
    func getValidation(text: String) -> ValidatableStatus {
        switch text.count {
        case 1..<3: return ValidationVoterName.tooShort
        case let count where count > 15: return ValidationVoterName.tooLong
        case let count where count == 0: return ValidationVoterName.initial
        default: return ValidationVoterName.valid
        }
    }
    
}
