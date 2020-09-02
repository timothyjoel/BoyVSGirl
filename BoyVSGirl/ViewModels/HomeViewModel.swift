//
//  HomeViewModel.swift
//  BoyVSGirl
//
//  Created by Timothy Stokarski on 05/08/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var votes: [Vote] = []
    
    func add(_ vote: Vote) {
        votes.append(vote)
    }
    
    func remove(_ vote: Vote) {
        votes = votes.filter { $0 != vote }
    }
    
    func percentage(_ gender: Gender) -> Double {
        guard votes.count > 0 else { return 0 }
        let allVotes = Double(self.votes.count)
        let girls = Double(self.votes.filter { $0.vote == .girl }.count)
        let boys = Double(self.votes.filter { $0.vote == .boy }.count)
        return gender == .boy ? (boys/allVotes)*100 : (girls/allVotes)*100
    }
    
}
