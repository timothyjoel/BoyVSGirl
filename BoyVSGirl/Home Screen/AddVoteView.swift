//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct AddVoteView: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showAddVote: Bool
    
    @State var selectedBoy: Bool = false
    
    var body: some View {
        VStack (spacing: 16) {
            VStack (spacing: 16) {
                IconView(name: .questionMark, size: .medium, weight: .semibold, color: .customViewBackground)
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.vertical, 8)
                .background(Color.girl)
                .clipShape(Circle())
                .offset(x: 0, y: -38)
                HStack (spacing: 16) {
                    GenderSelectionView(selectedBoy: $selectedBoy, gender: .girl)
                    GenderSelectionView(selectedBoy: $selectedBoy, gender: .boy)
                }
                .padding(.top, -40)
                .padding(.horizontal, 16)
                Button(action: {
                    self.showAddVote.toggle()
                }) {
                    Text("Vote")
                        .foregroundColor(Color.boy)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .padding(.bottom, 16)
                }
            }
            .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
            
        }
    }
    
}


struct GenderSelectionView: View {
    
    @Binding var selectedBoy: Bool
    var gender: Gender
    
    var body: some View {
        Button(action: {
            self.selectedBoy = self.gender == .boy ? true : false
        }) {
            VStack {
                Image(Images.gender.name)
                .resizable()
                .scaledToFit()
                .foregroundColor(self.selectedBoy ? (gender == .boy ? .boy : Color.label.opacity(0.2)): (gender == .girl ? .girl : Color.label.opacity(0.2)))
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(180))
                Text(gender == .boy ? "BOY" : "GIRL")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(self.selectedBoy ? (gender == .boy ? .boy : Color.label.opacity(0.2)): (gender == .girl ? .girl : Color.label.opacity(0.2)))
            }
            .scaleEffect(self.selectedBoy ? (gender == .boy ? 1.0 : 0.8) : (gender == .girl ? 1.0 : 0.8))
            .animation(.spring())
        }
    }
    
}
