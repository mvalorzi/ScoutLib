//
//  HelpView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI
import AVKit
struct HelpView: View {
    var mensaje: Mensajes;
    var body: some View {
        VStack{
            Text(mensaje.get(Frase.HELP_TITLE))
                .fontWeight(.black)
            Text(mensaje.get(Frase.HELP_P1)).fontWeight(.bold) .underline()
            Text(mensaje.get(Frase.HELP_P2)).font(.subheadline)
            Text(mensaje.get(Frase.HELP_P3)).font(.subheadline)
            Text(mensaje.get(Frase.HELP_P4)).font(.subheadline)
            Text(mensaje.get(Frase.HELP_P5)).fontWeight(.bold) .underline()
            Text(mensaje.get(Frase.HELP_P6)).font(.subheadline)
            
            Image(mensaje.get(Frase.HELP_IMAGE))
            VideoPlayer(player: AVPlayer(url:  URL(string: mensaje.get(Frase.HELP_VIDEO))!)) {
                VStack {
                    Text("").font(.subheadline)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
            }
           
      }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(mensaje: Mensajes(idioma: Idioma.EN))
    }
}
