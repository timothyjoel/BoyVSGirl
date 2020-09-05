//  Copyright © 2020 Timothy Stokarski. All rights reserved.

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var votes: [Vote] = []
    @Published var boys: Double = 0
    @Published var girls: Double = 0
    
    init() {
        setFractions()
    }
    
    func add(_ vote: Vote) {
        votes.append(vote)
        setFractions()
    }
    
    func remove(_ vote: Vote) {
        votes = votes.filter { $0 != vote }
        setFractions()
    }
    
    private func setFractions() {
        guard votes.count > 0 else { return }
        let allVotes = Double(self.votes.count)
        let girls = Double(self.votes.filter { $0.vote == .girl }.count)
        let boys = Double(self.votes.filter { $0.vote == .boy }.count)
        self.boys = (boys/allVotes)*100.round(to: 1)
        self.girls = (girls/allVotes)*100.round(to: 1)
    }
    
}
