//
//  TemaController.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 24/10/2021.
//

import Foundation
extension TemasView
{
    func loadThemesController() {
        guard let url = URL(string: urlString + "_CODE".localized) else {return}
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
