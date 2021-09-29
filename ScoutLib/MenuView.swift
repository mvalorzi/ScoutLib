//
//  MenuView.swift
//  CompuLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct MenuView: View {
    
    var mensaje: Mensajes = Mensajes(idioma: Idioma.EN);
    @State var esFlag: String = "es0"
    @State var enFlag: String = "en1"
    private let claveIdioma = "clave_idioma";
    let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
    
    private func setLang(idioma: Idioma){
        mensaje.idioma = idioma;
        enFlag = idioma == Idioma.EN ? "en1" : "en0";
        esFlag = idioma == Idioma.ES ? "es1" : "es0";
    }
    
    private func leerRutas(filtro: String) -> String {
        if let path = Bundle.main.path(forResource: "Rutas", ofType: "plist"), let plist = FileManager.default.contents(atPath: path) {
            do {
                let pListData = try PropertyListSerialization.propertyList(from: plist, options: [], format: nil) as! [String:AnyObject]
                for datos in pListData {
                   
                    if(filtro == datos.key){
                       return datos.value as? String ?? "";
                    }
                }
            } catch {
                print("Error leyendo plist: \(error)")
            }
        }
        return "";
       // return todo;
    }
    
    var body: some View {
            NavigationView{
                VStack{
                    if(deviceIdiom != .pad){
            NavigationLink(destination:   TemasView(urlString: leerRutas(filtro: "lista_temas") ,urlLibros: leerRutas(filtro: "lista_libros"), mensaje: mensaje)){
            HStack{
                Image("view-list")
                Text(mensaje.get(Frase.BOOKS))
                    .foregroundColor(Color.white)
                }
            }
                    }
           
           
                    NavigationLink(destination: FindView(urlLibros: leerRutas(filtro: "lista_busqueda"),mensaje: mensaje)){
            HStack{
                Image("system-search")
                Text(mensaje.get(Frase.FIND))
                    .foregroundColor(Color.white)
                }
            } .navigationBarTitle(mensaje.get(Frase.MENU))
                    NavigationLink(destination: HelpView(mensaje: mensaje)){
            HStack{
                Image("help-faq")
                Text(mensaje.get(Frase.HELP))
                    .foregroundColor(Color.white)
                }
            }
                    NavigationLink(destination: AboutView(mensaje: mensaje)){
            HStack{
                Image("user-info")
                Text(mensaje.get(Frase.ABOUT))
                    .foregroundColor(Color.white)
                }
            }
                    HStack{
                        Text(" ")
                        Button {
                            setLang(idioma: Idioma.EN)
                        }label: { Image(enFlag) }
                        Button {
                            setLang(idioma: Idioma.ES)
                        }label: { Image(esFlag)
                            
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
            if let value = UserDefaults.standard.string(forKey: claveIdioma){
                setLang(idioma: mensaje.StrToIdioma(value));
              }
            else {
                setLang(idioma: Idioma.EN)
            }
        }
        .onDisappear {
            UserDefaults.standard.set(mensaje.get(Frase.CODE), forKey: claveIdioma);
            UserDefaults.standard.synchronize();
        }
           .navigationViewStyle(StackNavigationViewStyle())
    }
  
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mensaje: Mensajes(idioma: Idioma.EN))
    }
}
