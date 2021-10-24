//
//  LibroController.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 24/10/2021.
//

import Foundation
extension LibrosView
{
    func loadBooksController() {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([Libro].self, from: data) {
                    DispatchQueue.main.async {
                        self.data = response_obj
                    }
                }
            }
        }.resume()
    }
}
