//  Copyright © 2020 Timothy Stokarski. All rights reserved.

import os.log
import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var votes: [Vote] = []
    @Published var boy: Double = 0
    @Published var girl: Double = 0
    
    var boysPerentage: String {
        boy.percentage()
    }
    
    var girlsPercentage: String {
        girl.percentage()
    }
    
    init() {
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
    }
    
    func add(_ vote: Vote, completion: @escaping (Result<Bool, HomeViewModelError>) -> Void) {
        CoreDataManager.shared.save(vote)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
        os_log(.info, log: .viewModel, "Current votes: girl - %f, boy - %f.", self.girl, self.boy)
        completion(.success(true))
    }
    
    func update(_ vote: Vote, with new: Vote){
        CoreDataManager.shared.update(vote, with: new)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
        os_log(.info, log: .viewModel, "Current votes: girl - %f, boy - %f.", self.girl, self.boy)
    }
    
    func delete(_ vote: Vote) {
        CoreDataManager.shared.delete(vote)
        CoreDataManager.shared.fetchVotes { [weak self] in self?.votes = $0 }
        setFractions()
        os_log(.info, log: .viewModel, "Removed vote from database: girl - %f, boy - %f.", self.girl, self.boy)
    }
    
    private func setFractions() {
        guard votes.count > 0 else {
            os_log(.info, log: .viewModel, "Didn't set fractions, there are no votes yet.")
            return
        }
        let allVotes = Double(self.votes.count)
        let girl = Double(self.votes.filter { $0.gender == .girl }.count)
        let boy = Double(self.votes.filter { $0.gender == .boy }.count)
        self.boy = (boy/allVotes)*100
        self.girl = (girl/allVotes)*100
    }
    
    func formatted(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
    
}

enum HomeViewModelError: Error {
    case invalidName
}
