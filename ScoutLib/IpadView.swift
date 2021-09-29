//
//  IpadView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct IpadView: View {
    @State var mensaje: Mensajes = Mensajes(idioma: Idioma.EN);
    private let claveIdioma = "clave_idioma";
    @State var esFlag: String = "es0"
    @State var enFlag: String = "en1"
    @State var actualizarTemas = true

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
    }
    
    private func setLang(idioma: Idioma){
        mensaje.idioma = idioma;
        enFlag = idioma == Idioma.EN ? "en1" : "en0";
        esFlag = idioma == Idioma.ES ? "es1" : "es0";
    }
    var body: some View {
        HStack{
            MenuView(mensaje: mensaje)
            TemasView(urlString: leerRutas(filtro: "lista_temas") ,urlLibros: leerRutas(filtro: "lista_libros"), mensaje: mensaje)

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

struct IpadView_Previews: PreviewProvider {
    static var previews: some View {
        IpadView(mensaje: Mensajes(idioma: Idioma.EN))
    }
}
