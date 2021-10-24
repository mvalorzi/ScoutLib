//
//  AboutView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
     
        VStack{
            Text("SCOUTLIB")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("_ABOUT_DESCRIPTION".localized)
                .font(.subheadline)
            Text("_ABOUT_VERSION".localized)
            Text("_ABOUT_DATE".localized)
            Text("_ABOUT_AUTHOR".localized)
        Text("Web: programas.aspx.com.ar")
            Image("compulib")
      }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}


