//
//  CountPresenter.swift
//  Watch count Watch App
//
//  Created by André  Lucas on 12/12/22.
//

import Foundation
import SwiftUI

class CountPresenter: ObservableObject {
    
    let dataManager = DataManager()
    
    @Published var timingInitial = 3
    
    @Published var count = 0
    @Published var cronometro = 10
    
    @Published var showCount = false
    @Published var showCongratulation = false
    
    func saveContador(contador: ContadorEntity){
        dataManager.saveContador(contador: contador)
    }
    
}
