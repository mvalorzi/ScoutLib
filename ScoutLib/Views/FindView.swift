//
//  FindView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct FindView: View {
    @State var inputText: String = ""
    @State public var urlLibros: String ;

    var body: some View {
        VStack{
            TextField("_FIND_TEXT".localized, text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray)
                        //   .frame(height: 44)
            NavigationLink(destination: LibrosView(urlString: urlLibros+inputText)){
            Image("system-search")
            }
            
        }
       .background(Color.gray)
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView(urlLibros: "")
    }
}
