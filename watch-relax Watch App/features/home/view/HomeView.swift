//
//  HomeView.swift
//  watch-relax Watch App
//
//  Created by André  Lucas on 06/12/22.
//

import SwiftUI

struct HomeView: View {
    @State var showIniciar = false
    @State var showRanking = false
    var body: some View {
        NavigationView {
            VStack{
                Button{
                    showIniciar = true
                } label: {
                    DefaultButton(title: "Iniciar", color: .green)
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $showIniciar){
                    CountView()
                }
                
                Button{
                    showRanking = true
                } label: {
                    DefaultButton(title: "Meu ranking", color: .blue)
                }
                .buttonStyle(.plain)
                .sheet(isPresented: $showRanking){
                    RankView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
