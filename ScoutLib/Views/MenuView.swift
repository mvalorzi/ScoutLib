//
//  MenuView.swift
//  CompuLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct MenuView: View {
    
    
    var body: some View {
            NavigationView{
                VStack{
                    if(deviceIdiom != .pad){
                        NavigationLink(destination:
                                    TemasView(urlString: ConnectionStrings.read( filtro: "lista_temas") ,urlLibros: ConnectionStrings.read( filtro: "lista_libros"))){
            HStack{
                Image("view-list")
                Text("_BOOKS".localized)
                    .foregroundColor(Color.white)
                }
            }
                    }
           
           
                    NavigationLink(destination: FindView(urlLibros: ConnectionStrings.read(filtro: "lista_busqueda"))){
            HStack{
                Image("system-search")
                Text("_FIND".localized)
                    .foregroundColor(Color.white)
                }
                    } .navigationBarTitle("_MENU".localized)
                    NavigationLink(destination: HelpView()){
            HStack{
                Image("help-faq")
                Text("_HELP".localized)
                    .foregroundColor(Color.white)
                }
            }
                    NavigationLink(destination: AboutView()){
            HStack{
                Image("user-info")
                Text("_ABOUT".localized)
                    .foregroundColor(Color.white)
                }
            }
                   
                }
                .frame(
                   minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .topLeading
                 )
                .background(Color.blue)
            }
           
            .onAppear {
        }
        .onDisappear {
        }
           .navigationViewStyle(StackNavigationViewStyle())
    }
  
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
