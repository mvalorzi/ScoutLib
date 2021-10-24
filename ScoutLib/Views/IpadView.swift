//
//  IpadView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct IpadView: View {
    @State var actualizarTemas = true
    
    var body: some View {
        HStack{
            MenuView()
            TemasView(urlString: ConnectionStrings.read( filtro: "lista_temas") ,urlLibros: ConnectionStrings.read( filtro: "lista_libros"))

        }
                .onAppear {
        }
        .onDisappear {
        }
           .navigationViewStyle(StackNavigationViewStyle())
            
    }
     
  }

struct IpadView_Previews: PreviewProvider {
    static var previews: some View {
        IpadView()
    }
}
