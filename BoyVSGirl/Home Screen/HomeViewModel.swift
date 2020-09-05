//  Copyright © 2020 Timothy Stokarski. All rights reserved.

import os.log
import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var votes: [Vote] = []
    @Published var boys: Double = 0
    @Published var girls: Double = 0
    
    init() {
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
    }
    
    func add(_ vote: Vote) {
        CoreDataManager.shared.save(vote)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
    }
    
    func remove(_ vote: Vote) {
        votes = votes.filter { $0 != vote }
        setFractions()
    }
    
    private func setFractions() {
        guard votes.count > 0 else { return }
        let allVotes = Double(self.votes.count)
        let girls = Double(self.votes.filter { $0.gender == .girl }.count)
        let boys = Double(self.votes.filter { $0.gender == .boy }.count)
        self.boys = (boys/allVotes)*100.round(to: 1)
        self.girls = (girls/allVotes)*100.round(to: 1)
    }
    
}
