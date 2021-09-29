//
//  Tema.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import Foundation
class Tema: Decodable{
    var id: String
    var title: String
    var image: String
    var content: String
    
    init(id: String, title: String, image: String, content: String){
        self.id = id
        self.title = title
        self.image = image
        self.content = content
    }
}
