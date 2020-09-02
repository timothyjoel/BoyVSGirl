//  Created by Timothy Stokarski on 05/08/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack (spacing: 16) {
                Button(action: {
                    self.vm.add(Vote(voter: "Helenka", vote: .boy))
                }) {
                    Text("Vote!")
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50, alignment: .center)
                        .background(RoundedCorners(color: Color.main, tl: 16, tr: 16, bl: 16, br: 16))
                }
                Spacer()
                HStack (spacing: 0) {
                    Spacer()
                    GenderStatsView(vm: vm, gender: .boy, image: .boy, color: .main)
                    Spacer()
                    GenderStatsView(vm: vm, gender: .girl, image: .girl, color: .main2)
                    Spacer()
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct GenderImage: View {
    
    var gender: Images
    
    init(_ gender: Images) {
        self.gender = gender
    }
    
    var body: some View {
        Image(gender.image)
            .resizable()
            .frame(width: UIScreen.height/5, height: UIScreen.height/5, alignment: .center)
            .scaledToFit()
    }
}

struct GenderStatsView: View {
    
    @ObservedObject var vm: HomeViewModel
    var gender: Gender
    var image: Images
    var color: Color
    
    var body: some View {
        VStack (spacing: 0) {
            Text("\(self.vm.percentage(gender)) %")
                .animation(nil)
            GenderImage(image)
            Spacer()
                .frame(width: UIScreen.width/3, height: UIScreen.height/2.5, alignment: .center)
                .background(RoundedCorners(color: color, tl: 24, tr: 24, bl: 24, br: 24))
                .overlay(RoundedRectangle(cornerRadius: 24).stroke(style: .init(lineWidth: 5)))
                .animation(.spring())
        }
    }
}
