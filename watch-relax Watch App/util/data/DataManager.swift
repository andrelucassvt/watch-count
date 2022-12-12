//
//  DataManager.swift
//  Watch count Watch App
//
//  Created by André  Lucas on 08/12/22.
//

import Foundation
import CoreData

let nameKey = "ranking"

protocol DataManagerProtocol: AnyObject {
    func getRanking(completion: @escaping (Result<[ContadorEntity], Error>) -> Void)
    func saveContador(contador: ContadorEntity)
}


class DataManager: DataManagerProtocol {
    
    private var contagens: [ContadorEntity] = []
    private let encoder = JSONEncoder()
    private let manager = UserDefaults.standard
    
    
    private func getContagens() -> [ContadorEntity] {
        if let data = manager.data(forKey: nameKey) {
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([ContadorEntity].self, from: data)
                contagens = result
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        return contagens
    }
    
    func getRanking(completion: @escaping (Result<[ContadorEntity], Error>) -> Void) {
        let result = getContagens()
        return completion(.success(result))
    }
    
    func saveContador(contador: ContadorEntity) {
        do {
            let result = getContagens()
            contagens.insert(contador, at: 0)
            let data = try encoder.encode(contagens)
            manager.set(data, forKey: nameKey)
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
}
