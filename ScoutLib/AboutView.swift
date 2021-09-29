//
//  AboutView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct AboutView: View {
    
    var mensaje: Mensajes;
    var body: some View {
     
        VStack{
            Text("SCOUTLIB")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(mensaje.get(Frase.ABOUT_DESCRIPTION))
                .font(.subheadline)
            Text(mensaje.get(Frase.ABOUT_VERSION))
            Text(mensaje.get(Frase.ABOUT_DATE))
            Text(mensaje.get(Frase.ABOUT_AUTHOR))
        Text("Web: programas.aspx.com.ar")
            Image("compulib")
      }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(mensaje: Mensajes(idioma: Idioma.EN))
    }
}
