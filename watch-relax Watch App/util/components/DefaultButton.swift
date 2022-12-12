//
//  DefaultButton.swift
//  watch-relax Watch App
//
//  Created by André  Lucas on 06/12/22.
//

import SwiftUI

struct DefaultButton: View {
    var title: String
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .foregroundColor(color)
            .overlay{
                Text(title)
            }
    }
}

struct DefaultButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButton(title: "count", color: .blue)
    }
}
