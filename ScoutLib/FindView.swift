//
//  FindView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct FindView: View {
    @State var inputText: String = ""
    @State public var urlLibros: String ;
    var mensaje: Mensajes;
    var body: some View {
        VStack{
            TextField(mensaje.get(Frase.FIND_TEXT), text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray)
                        //   .frame(height: 44)
            NavigationLink(destination: LibrosView(urlString: urlLibros+inputText, mensaje: mensaje)){
            Image("system-search")
            }
            
        }
       .background(Color.gray)
    }
}
