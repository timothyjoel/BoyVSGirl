//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import SwiftUI
import Combine

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    @State var showMenu: Bool = false
    @State var showDeletePopup: Bool = false
    @State var showGirlStats: Bool = false
    @State var showBoyStats: Bool = false
    @State var showAddVote: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        print("TAPPED MENU")
                    }) {
                        Icon(name: .menu, color: .appWhite)
                    }
                    Spacer()
                    Icon(name: .trash, color: .appWhite)
                }
                .padding([.horizontal, .top])
                HStack (spacing: 0) {
                    Image("pacifier")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(16)
                        .background(Circle())
                        .foregroundColor(.appWhite)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    Spacer()
                        .frame(width: 24, height: 6, alignment: .center)
                    VStack {
                        HStack (spacing: 8) {
                           Text("Baby")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                            .foregroundColor(.appWhite)
                            Text("Prediction")
                            .font(.system(size: 32, weight: .regular, design: .rounded))
                            .foregroundColor(.appWhite)
                            Spacer()
                        }
                        HStack {
                            Text("20%")
                                .foregroundColor(.appWhite)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            Spacer()
                            Text("80%")
                                .foregroundColor(.appWhite)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        }
                        HStack  {
                            Spacer()
                        }
                        .frame(height: 6, alignment: .center)
                        .background(RoundedCorners(color: .yellow, tl: 3, tr: 3, bl: 3, br: 3))
                        
                    }
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 16)
                .padding(.bottom, 40)
                VStack (spacing: 0) {
                   Spacer()
                    .frame(width: 50, height: 4)
                    .background(RoundedCorners(color: .background, tl: 2, tr: 2, bl: 2, br: 2))
                    .offset(y: -12)
                    HStack {
                       Text("Votes")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.darkGrey)
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<10) { _ in
                                VStack (alignment: .leading, spacing: 6) {
                                    HStack {
                                        Image("folder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .padding([.leading, .top], 16)
                                        .shadow(color: Color.blue.opacity(0.5), radius: 6, x: 0, y: 4)
                                        Spacer()
                                    }
                                        Text("Girl votes")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.darkBlue)
                                        .padding(.leading)
                                    Text("Last vote: 18.09.2020")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .foregroundColor(.lightGrey)
                                    .padding(.leading)
                                    
                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .frame(width: UIScreen.width/2, height: 110)
                                .background(RoundedCorners(color: .appWhite, tl: 16, tr: 16, bl: 16, br: 16))
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.leading, 24)
                        .padding(.bottom, 16)
                    }
                    HStack {
                       Text("Last votes")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.darkGrey)
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    
                    ScrollView (.vertical, showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(0..<10) { _ in
                                HStack (alignment: .center, spacing: 16) {
                                  Image("avatar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .padding(.leading, 16)
                                    VStack (alignment: .leading) {
                                        Text("Peter Randomski")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .foregroundColor(.darkBlue)
                                        Text("Added: 20.09.2020")
                                        .font(.system(size: 13, weight: .bold, design: .rounded))
                                        .foregroundColor(.lightGrey)
                                    }
                                    Spacer()
                                    Image("gender")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.darkGrey)
                                    .frame(width: 45, height: 45)
                                    .padding(.trailing, 16)
                                }
                                .frame(width: UIScreen.width-48, height: 80)
                                .background(RoundedCorners(color: .superLightGrey, tl: 16, tr: 16, bl: 16, br: 16))
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                }
                .frame(width: UIScreen.width)
                .background(RoundedCorners(color: .background, tl: 32, tr: 32, bl: 0, br: 0))
                .edgesIgnoringSafeArea(.bottom)
            }
        }.onAppear {
            os_log(.info, log: .view, "HomeView appeared")
        }
        .onDisappear {
            os_log(.info, log: .view, "HomeView diappeared")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
//
//// MARK: - View components
//
//fileprivate struct NavigationBar: View {
//    
//    @Binding var showDeletePopup: Bool
//    @Binding var showMenu: Bool
//    
//    var body: some View {
//        HStack {
//            HStack {
//                Button(action: {
//                    self.showMenu.toggle()
//                }) {
//                    IconView(name: .menu, size: .medium, weight: .regular, color: Color.blue)
//                }
//                .padding(.trailing, 8)
//            }
//            .frame(width: 50, height: 40, alignment: .trailing)
//            .background(RoundedCorners(color: Color.blue, tl: 0, tr: 16, bl: 0, br: 16))
//            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
//            Spacer()
//            HStack {
//                Button(action: {
//                    self.showDeletePopup.toggle()
//                }) {
//                    IconView(name: .trash, size: .medium, weight: .regular, color: Color.blue)
//                }
//                .padding(.leading, 8)
//                Spacer()
//            }
//            .frame(width: 50, height: 40, alignment: .leading)
//            .background(RoundedCorners(color: Color.blue, tl: 16, tr: 0, bl: 16, br: 0))
//            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
//            
//        }
//    }
//    
//}
//
//fileprivate struct GirlStatisticsView: View {
//    
//    @ObservedObject var vm: HomeViewModel
//    @Binding var showGirlStats: Bool
//    
//    var body: some View {
//        HStack {
//            GenderImageView(.girl)
//                .padding(.vertical)
//            Spacer()
//            Text(vm.girl.percentage())
//                .font(.system(size: 70, weight: .bold, design: .rounded))
//                .foregroundColor(.blue)
//                .multilineTextAlignment(.center)
//                .animation(nil)
//            Spacer()
//        }
//            //        .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
//            //        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
//            .padding(.horizontal)
//            .offset(y: -30)
//    }
//
//}
//
//struct HomeRingChart: View {
//    
//    @ObservedObject var vm: HomeViewModel
//    @Binding var showAddVote: Bool
//    
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(lineWidth: 40.0)
//                .foregroundColor(Color.girl)
//                .frame(width: UIScreen.width * 2/3, height: UIScreen.width * 2/3, alignment: .center)
//                .animation(.spring())
//            Circle()
//                .trim(from: 0.0, to: CGFloat(vm.boy/100))
//                .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
//                .foregroundColor(Color.boy)
//                .frame(width: UIScreen.width * 2/3, height: UIScreen.width * 2/3, alignment: .center)
//                .animation(.spring())
//            Button(action: {
//                self.showAddVote.toggle()
//            }) {
//                Text("VOTE")
//                    .font(.system(size: 24, weight: .bold, design: .rounded))
//                    .foregroundColor(Color.white)
//                    .frame(width: 90, height: 90, alignment: .center)
//                    .background(RoundedCorners(color: Color.label, tl: 45, tr: 45, bl: 45, br: 45))
//            }
//        }
//        .animation(.spring())
//    }
//}
//
//fileprivate struct BoyStatisticsView: View {
//    
//    @ObservedObject var vm: HomeViewModel
//    @Binding var showBoyStats: Bool
//    
//    var body: some View {
//        HStack {
//            Spacer()
//            Text(vm.boy.percentage())
//                .font(.system(size: 70, weight: .bold, design: .rounded))
//                .foregroundColor(.boy)
//                .multilineTextAlignment(.center)
//                .animation(nil)
//            Spacer()
//                GenderImageView(.boy)
//                .padding(.vertical)
//        }
//        .animation(.spring())
////        .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
////        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
//        .padding(.horizontal)
//        .offset(y: 30)
//    }
//
//}
