//
//  PresentationView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct PresentationView: View {
    var item: Libro;
    
    var body: some View {
        VStack{
            Text(item.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.orange)
          
        Text(item.Contenido)
            Button {
                        if let url = URL(string: item.url) {
                            UIApplication.shared.open(url)}
            }
          
            label: {
                ImageAsync(item.Foto)
                    .padding(10)
            }
            HStack{
                Text("_LANGUAGE".localized + item.Idioma)
                                  if(item.Idioma ==  "es") { Image("es4") }
                                  else if(item.Idioma ==  "en") { Image("en4") }
              }
            Button("_VIEW".localized){
                if let url = URL(string: item.url) {
                    UIApplication.shared.open(url)}
            }
            .font(.title)
          }
        }
        
    }


