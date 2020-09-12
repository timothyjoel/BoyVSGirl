//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//
//
//import SwiftUI
//
//struct AddVoteView: View {
//
//    @ObservedObject var vm: HomeViewModel
//    @Binding var showAddVote: Bool
//
//    @State private var selectedBoy: Bool = false
//    @State private var voter: String = ""
//    @State private var voterPlaceholder: String = "Enter voter name"
//
//    var body: some View {
//        VStack (spacing: 16) {
//            VStack (spacing: 16) {
//                IconView(name: .questionMark, size: .medium, weight: .semibold, color: .customViewBackground)
//                .frame(width: 60, height: 60, alignment: .center)
//                .padding(.vertical, 8)
//                .background(Color.girl)
//                .clipShape(Circle())
//                .offset(x: 0, y: -38)
//                Text("What are we expecting?")
//                    .multilineTextAlignment(.center)
//                    .lineLimit(2)
//                    .foregroundColor(Color.label)
//                    .font(.system(size: 24, weight: .bold, design: .rounded))
//                    .offset(x: 0, y: -46)
//                HStack (spacing: 16) {
//                    GenderSelectionView(selectedBoy: $selectedBoy, gender: .girl)
//                    GenderSelectionView(selectedBoy: $selectedBoy, gender: .boy)
//                }
//                .padding(.top, -40)
//                .padding(.horizontal, 16)
//                TextField(voterPlaceholder, text: self.$voter)
//                .multilineTextAlignment(.center)
//                .font(.system(size: 24, weight: .bold, design: .rounded))
//                .frame(width: 280)
//                .accentColor(selectedBoy ? .boy : .girl)
//                .foregroundColor(Color.label)
//                .padding(.horizontal, 16)
//                Button(action: {
//                    self.vm.add(Vote(voter: self.voter, gender: self.selectedBoy ? .boy : .girl)) { result, status in
//                        switch result {
//                        case .failure(.invalidName):
//                            self.voter = ""
//                            self.voterPlaceholder = status.placeholder
//                        case .success(_):
//                            self.showAddVote.toggle()
//                            self.voterPlaceholder = status.placeholder
//                            self.voter = ""
//                        }
//                    }
//                }) {
//                    Text("VOTE")
//                        .frame(width: 200)
//                        .foregroundColor(.customViewBackground)
//                        .font(.system(size: 18, weight: .bold, design: .rounded))
//                        .padding(16)
//                        .background(RoundedCorners(color: Validator.validate(voter) == .valid ? .girl : Color.label.opacity(0.2), tl: 16, tr: 16, bl: 16, br: 16))
//                }
//                Button(action: {
//                    self.showAddVote.toggle()
//                    self.voter = ""
//                }) {
//                    Text("Close")
//                    .foregroundColor(.girl)
//                    .font(.system(size: 18, weight: .bold, design: .rounded))
//                    .frame(width: 200)
//                }
//                .padding(.bottom, 24)
//            }
//            .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
//        }
//    }
//
//}
//
//
//struct GenderSelectionView: View {
//
//    @Binding var selectedBoy: Bool
//    var gender: Gender
//
//    var body: some View {
//        Button(action: {
//            self.selectedBoy = self.gender == .boy ? true : false
//        }) {
//            VStack {
//                Image(Images.gender.name)
//                .resizable()
//                .scaledToFit()
//                .foregroundColor(self.selectedBoy ? (gender == .boy ? .boy : Color.label.opacity(0.2)): (gender == .girl ? .girl : Color.label.opacity(0.2)))
//                .frame(width: 100, height: 100, alignment: .center)
//                .rotationEffect(.degrees(gender == .boy ? 180 : 0))
//                Text(gender == .boy ? "BOY" : "GIRL")
//                .font(.system(size: 20, weight: .bold, design: .rounded))
//                .foregroundColor(self.selectedBoy ? (gender == .boy ? .boy : Color.label.opacity(0.2)): (gender == .girl ? .girl : Color.label.opacity(0.2)))
//            }
//            .scaleEffect(self.selectedBoy ? (gender == .boy ? 1.0 : 0.8) : (gender == .girl ? 1.0 : 0.8))
//            .animation(.spring())
//        }
//    }
//
//}
