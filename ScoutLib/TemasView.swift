//
//  TemasView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//
import SwiftUI

struct TemasView: View {
    
    
    @State private var data = [Tema]()
    @State public var urlString: String ; //Lista de Temas
    @State public var urlLibros: String ; //Lista de Libros
    @State  var mensaje: Mensajes;
    let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
    
    var body: some View {
        VStack{
     
            NavigationView{
              
            List(data, id: \.id) { item in
                NavigationLink(destination: LibrosView(urlString: urlLibros + item.id + "&idioma=" + mensaje.get(Frase.CODE) , mensaje: mensaje))
            {
            HStack{
                    ImageAsync(item.image)
                            .frame(width:96, height:  96)
                            .padding(10)
                            .disabled(true)
                
                    Text(item.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .disabled(true)
                  Spacer()
                }
            }
           .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
                .navigationBarTitle(mensaje.get(Frase.THEMES))
           .background(Color.blue)
        }.onAppear(perform: loadData)
            }}               }}

extension TemasView
{
    func loadData() {
        guard let url = URL(string: urlString + mensaje.get(Frase.CODE)) else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([Tema].self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.data = response_obj
                    }
                }
            }
        }.resume()
    }
}
