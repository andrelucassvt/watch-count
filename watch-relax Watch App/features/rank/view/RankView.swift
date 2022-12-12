//
//  RankView.swift
//  watch-relax Watch App
//
//  Created by André  Lucas on 06/12/22.
//

import SwiftUI

struct RankView: View {
    @ObservedObject var controller = RankPresenter()
    var body: some View {
        VStack{
            HStack(){
                Spacer()
                Text("Ranking")
            }
            List{
                switch controller.state{
                case .loading:
                    ProgressView()
                case .success(let data):
                    ForEach(data) { datum in
                        Text(datum.contagem.description)
                    }
                case .error(let error):
                    Text(error.localizedDescription)
                default:
                    EmptyView()
                }
            }
        }
        .onAppear{
            controller.getRanks()
        }
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
