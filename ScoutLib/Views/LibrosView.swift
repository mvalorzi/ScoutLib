//
//  TemasView.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//
import SwiftUI


struct LibrosView: View {
    @State var urlString: String;
    @State public var data : [Libro] = [Libro]()
    
    private func leadingPadding(_ geometry: GeometryProxy) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            // A hack for correct display of the SplitView in SwiftUI on iPad
            return geometry.size.width < geometry.size.height ? 0.5 : -0.5
        }
        return 0
    }
    
    var body: some View {
        
        NavigationView{List(data, id: \.id) { item in
                HStack{
                    ImageAsync(item.image)
                        .frame(width:96, height:  96)
                        .padding(10)
                    
                    VStack(alignment: .leading){
                        Text(item.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(item.Contenido)
                            .font(.subheadline)
                        HStack{
                            Text("_LANGUAGE".localized + item.Idioma)
                                              if(item.Idioma ==  "es") { Image("es4") }
                                              else if(item.Idioma ==  "en") { Image("en4") }
                          }
                        NavigationLink(destination: PresentationView( item: item)){
                        }
                    }
                    Spacer()
                }
        }
      
        .onAppear(perform: loadBooksController)}
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}



