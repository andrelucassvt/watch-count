//
//  RankPresenter.swift
//  Watch count Watch App
//
//  Created by André  Lucas on 10/12/22.
//

import Foundation


enum RankState {
    case na
    case loading
    case success(data: [ContadorEntity])
    case error(failure: Error)
}

class RankPresenter: ObservableObject {
    let manager = DataManager()
    
    @Published private(set) var state: RankState = .na
    
    
    func getRanks(){
        state = .loading
        manager.getRanking{ result in
            switch result {
            case .success(let list):
                let result = list.sorted(by: {$0.contagem > $1.contagem})
                self.state = .success(data: result)
            case .failure(let error):
                self.state = .error(failure: error)
            }
        }
    }
    
    
}
