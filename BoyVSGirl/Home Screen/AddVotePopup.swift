//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import SwiftUI
import Combine

struct AddVotePopup: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showAddVote: Bool
    
    @State private var isValid: Bool = false
    @State private var gender: Gender = .boy
    @State private var voter: String = ""
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 24) {
            HomeSectionTitle(title: "Add vote")
                .padding(.horizontal, 24)
                .padding(.top, 16)
            CustomImage(image: .avatar)
                .frame(width: 60, height: 60, alignment: .center)
            NameTextfield(isValid: self.$isValid, text: self.$voter)
            HStack (spacing: 16) {
                Button(action: {
                    self.gender = .girl
                }) {
                    VStack {
                      CustomImage(image: .gender)
                        .foregroundColor(gender == .girl ? .darkBlue : .lightGrey)
                        .frame(width: 60, height: 60)
                      Text("Girl")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(gender == .girl ? .darkBlue : .lightGrey)
                    }
                    .scaleEffect(gender == .girl ? 1.0 : 1.1)
                    .animation(.spring())
                }
                Button(action: {
                    self.gender = .boy
                }) {
                    VStack {
                        CustomImage(image: .gender)
                            .foregroundColor(gender == .boy ? .darkBlue : .lightGrey)
                            .rotationEffect(.degrees(180))
                            .frame(width: 60, height: 60)
                        Text("Boy")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(gender == .boy ? .darkBlue : .lightGrey)
                    }
                    .scaleEffect(gender == .boy ? 1.1 : 1.0)
                    .animation(.spring())
                }

            }
            Button(action: {
//                self.vm.add(Vote(voter: voter, gender: gender)) { (result, status) in
//                    switch result {
//                    case .success(_):
//                        self.voter = ""
//                        self.placeholder = status.placeholder
//                    case .failure(_):
//                        self.voter = ""
//                        self.
//                    }
//                }
                self.showAddVote.toggle()
            }) {
                CustomImage(image: .add)
                .frame(width: 50, height: 50)
                .offset(y: 25)
            
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 300)
        .background(RoundedCorners(color: .background, tl: 24, tr: 24, bl: 24, br: 24))
        .offset(x: 0, y: showAddVote ? 0 : UIScreen.height)
        .animation(.spring())
    }
    
}
