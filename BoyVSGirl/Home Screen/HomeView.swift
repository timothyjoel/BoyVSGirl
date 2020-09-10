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
            Color.background.edgesIgnoringSafeArea(.all)
            VStack (alignment: .center) {
                NavigationBar(showDeletePopup: self.$showDeletePopup, showMenu: self.$showMenu)
                Spacer()
                GirlStatisticsView(vm: vm, showGirlStats: self.$showGirlStats)
                HomeRingChart(vm: vm, showAddVote: self.$showAddVote)
                BoyStatisticsView(vm: vm, showBoyStats: self.$showBoyStats)
                Spacer()
            }
            .allowsHitTesting(!showAddVote)
            .blur(radius: self.showAddVote ? 25 : 0)
            
            AddVoteView(vm: self.vm, showAddVote: self.$showAddVote)
            .offset(y: showAddVote ? 0 : UIScreen.height)
            .animation(.spring())

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

// MARK: - View components

fileprivate struct NavigationBar: View {
    
    @Binding var showDeletePopup: Bool
    @Binding var showMenu: Bool
    
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    self.showMenu.toggle()
                }) {
                    IconView(name: .menu, size: .medium, weight: .regular, color: Color.girl)
                }
                .padding(.trailing, 8)
            }
            .frame(width: 50, height: 40, alignment: .trailing)
            .background(RoundedCorners(color: Color.customViewBackground, tl: 0, tr: 16, bl: 0, br: 16))
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
            Spacer()
            HStack {
                Button(action: {
                    self.showDeletePopup.toggle()
                }) {
                    IconView(name: .trash, size: .medium, weight: .regular, color: Color.girl)
                }
                .padding(.leading, 8)
                Spacer()
            }
            .frame(width: 50, height: 40, alignment: .leading)
            .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 0, bl: 16, br: 0))
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
            
        }
    }
    
}

fileprivate struct GirlStatisticsView: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showGirlStats: Bool
    
    var body: some View {
        HStack {
            VStack (alignment: .center) {
                GenderImageView(.girl)
                Text("\(vm.girl)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color.label)
                    .multilineTextAlignment(.center)
                    .animation(nil)
            }
            .padding(.vertical)
            Spacer()
        }
//        .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
//        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
        .padding(.horizontal)
        .offset(y: -30)
    }

}

struct HomeRingChart: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showAddVote: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 40.0)
                .foregroundColor(Color.girl)
                .frame(width: UIScreen.width * 2/3, height: UIScreen.width * 2/3, alignment: .center)
                .animation(.spring())
            Circle()
                .trim(from: 0.0, to: CGFloat(vm.boy/100))
                .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.boy)
                .frame(width: UIScreen.width * 2/3, height: UIScreen.width * 2/3, alignment: .center)
                .animation(.spring())
            Button(action: {
                self.showAddVote.toggle()
            }) {
                Text("VOTE")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
                    .frame(width: 90, height: 90, alignment: .center)
                    .background(RoundedCorners(color: Color.label, tl: 45, tr: 45, bl: 45, br: 45))
            }
        }
        .animation(.spring())
    }
}

fileprivate struct BoyStatisticsView: View {
    
    @ObservedObject var vm: HomeViewModel
    @Binding var showBoyStats: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack (alignment: .center) {
                GenderImageView(.boy)
                Text("\(vm.boy)")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(Color.label)
                    .multilineTextAlignment(.center)
                    .animation(nil)
            }
            .padding(.vertical)
        }
        .animation(.spring())
//        .background(RoundedCorners(color: Color.customViewBackground, tl: 16, tr: 16, bl: 16, br: 16))
//        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 5)
        .padding(.horizontal)
        .offset(y: 30)
    }

}
