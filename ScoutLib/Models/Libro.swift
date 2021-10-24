//
//  Datos.swift
//  TableViewBase
//
//  Created by Martín Valorzi on 02/04/2021.
//

import SwiftUI

class Libro: Decodable {
    var id: String
    var title: String
    var image: String
    var url:String
    var Contenido:String
    var Foto: String
    var Tema: String
    var Idioma: String
    init(id: String, title: String, image: String, url: String, Contenido: String, Foto: String, Tema: String, Idioma: String) {
        self.id = id; self.title = title; self.image = image; self.url = url; self.Contenido = Contenido; self.Foto = Foto; self.Tema = Tema; self.Idioma = Idioma;
    }
}
