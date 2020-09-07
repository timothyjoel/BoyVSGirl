//  Copyright © 2020 Timothy Stokarski. All rights reserved.

import os.log
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var votes: [Vote] = []
    @Published var boy: Double = 0
    @Published var girl: Double = 0
    
    init() {
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
    }
    
    func add(_ vote: Vote) {
        CoreDataManager.shared.save(vote)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
        os_log(.info, log: .viewModel, "Current votes: girl - %f, boy - %f.", self.girl, self.boy)
    }
    
    func update(_ vote: Vote, with new: Vote){
        CoreDataManager.shared.update(vote, with: new)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
        os_log(.info, log: .viewModel, "Current votes: girl - %f, boy - %f.", self.girl, self.boy)
    }
    
    func remove(_ vote: Vote) {
        votes = votes.filter { $0 != vote }
        setFractions()
        os_log(.info, log: .viewModel, "Removed vote from database: girl - %f, boy - %f.", vote.gender.asString, vote.voter)
    }
    
    private func setFractions() {
        guard votes.count > 0 else { return }
        let allVotes = Double(self.votes.count)
        let girl = Double(self.votes.filter { $0.gender == .girl }.count)
        let boy = Double(self.votes.filter { $0.gender == .boy }.count)
        self.boy = (boy/allVotes)*100.round(to: 1)
        self.girl = (girl/allVotes)*100.round(to: 1)
    }
    
}
