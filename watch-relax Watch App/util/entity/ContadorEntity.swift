//
//  ContadorEntity.swift
//  Watch count Watch App
//
//  Created by André  Lucas on 08/12/22.
//

import Foundation


struct ContadorEntity: Decodable, Encodable, Identifiable {
    var id = UUID()
    var contagem: Int
}
