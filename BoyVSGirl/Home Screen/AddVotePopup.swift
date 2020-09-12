//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import SwiftUI
import Combine

struct AddVotePopup: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showAddVote: Bool
    @State private var selectedBoy: Bool = true
    @State private var voter: String = ""
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 24) {
            HomeSectionTitle(title: "Add vote")
                .padding(.horizontal, 24)
                .padding(.top, 16)
            CustomImage(image: .avatar)
                .frame(width: 60, height: 60, alignment: .center)
            TextField("Enter your name", text: $voter)
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.darkBlue)
            HStack (spacing: 16) {
                Button(action: {
                    self.selectedBoy = false
                }) {
                    VStack {
                      CustomImage(image: .gender)
                        .foregroundColor(selectedBoy ? .lightGrey : .darkBlue)
                        .frame(width: 60, height: 60)
                      Text("Girl")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(selectedBoy ? .lightGrey : .darkBlue)
                    }
                    .scaleEffect(selectedBoy ? 1.0 : 1.1)
                    .animation(.spring())
                }
                Button(action: {
                    self.selectedBoy = true
                }) {
                    VStack {
                        CustomImage(image: .gender)
                            .foregroundColor(selectedBoy ? .darkBlue : .lightGrey)
                            .rotationEffect(.degrees(180))
                            .frame(width: 60, height: 60)
                        Text("Boy")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(selectedBoy ? .darkBlue : .lightGrey)
                    }
                    .scaleEffect(selectedBoy ? 1.1 : 1.0)
                    .animation(.spring())
                }

            }
            Button(action: {
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
