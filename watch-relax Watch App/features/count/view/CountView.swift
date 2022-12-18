//
//  CountView.swift
//  watch-relax Watch App
//
//  Created by André  Lucas on 06/12/22.
//

import SwiftUI

struct CountView: View {
    
    @ObservedObject var controller = CountPresenter()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            if(controller.showCongratulation && !controller.showCount){
                VStack{
                    Text("Parabéns")
                        .padding()
                    Text("Você conseguiu fazer \(controller.count) cliques em 10 segundos")
                        .multilineTextAlignment(.center)
                }
            }
            
            if(!controller.showCount && !controller.showCongratulation){
                Text(controller.timingInitial.description)
                    .font(.system(size: 30))
                    .onReceive(timer){ time in
                        if controller.timingInitial <= 0{
                            controller.showCount = true
                        }
                        if controller.timingInitial > 0 {
                            controller.timingInitial -= 1
                        }
                    }
            }
            if(controller.showCount && !controller.showCongratulation) {
                VStack{
                    HStack{
                        Spacer()
                        Ellipse()
                            .frame(width: 30,height: 30)
                            .overlay{
                                Text(controller.cronometro.description)
                                    .foregroundColor(.red)
                                    .onReceive(timer){ time in
                                        if controller.cronometro <= 0 {
                                            controller.saveContador(contador: ContadorEntity(
                                                contagem: controller.count))
                                            controller.showCount = false
                                            controller.showCongratulation = true
                                            
                                        }
                                        if controller.cronometro > 0 {
                                            controller.cronometro -= 1
                                        }
                                    }
                            }
                    }
                    Text("Contador")
                        .font(.system(size: 10))
                    Text(controller.count.description)
                        .padding(.bottom,40)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: .infinity,height: .infinity)
                        .foregroundColor(.red)
                        .onTapGesture {
                            controller.count += 1
                        }
                }
            }
        }
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}
