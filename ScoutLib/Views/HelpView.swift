//
//  HelpView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//

import SwiftUI
import AVKit
struct HelpView: View {
    var body: some View {
        VStack{
            Text("_HELP_TITLE".localized)
                .fontWeight(.black)
            Text("_HELP_P1".localized).fontWeight(.bold) .underline()
            Text("_HELP_P2".localized).font(.subheadline)
            Text("_HELP_P3".localized).font(.subheadline)
            Text("_HELP_P4".localized).font(.subheadline)
            Text("_HELP_P5".localized).fontWeight(.bold) .underline()
            Text("_HELP_P6".localized).font(.subheadline)
            
            Image("_HELP_IMAGE".localized)
            VideoPlayer(player: AVPlayer(url:  URL(string: "_HELP_VIDEO")!)) {
                VStack {
                    Text("").font(.subheadline)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
            }
           
      }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
