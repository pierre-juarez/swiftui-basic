//
//  ContentView.swift
//  orderingElements
//
//  Created by Pierre Juarez U. on 30/12/22.
//

import SwiftUI

 /**
  Contenedores
    VStack ==> Vertical
    HStack ==> Horizontal
    ZStack ==> fondo
  */

struct ContentView: View {
    var body: some View {
     orderingViews()
    }
}

struct orderingViews: View {
  var body: some View{
    ZStack{
      Color.blue.edgesIgnoringSafeArea(.all)
      HStack{
        Image("icon-futurama-bender")
          .resizable()
          .frame(width: 144, height: 144, alignment: .center)
        VStack(alignment: .leading, spacing: 10){
          Text("Bender Bending Rodríguez")
            .bold()
            .foregroundColor(.white)
            .font(.largeTitle)
          Text("Vive en la galaxia de Futurama, o eso parece👀")
            .italic()
            .foregroundColor(.white)
            .font(.title)
        }
      }
    }
  }
}

struct viewFirst: View {
  var body: some View{
    VStack(alignment: .leading, spacing: 25){
          Image(systemName: "globe")
              .imageScale(.large)
              .foregroundColor(.accentColor)
          Text("Hello, world!").font(.caption2)
          Text("Hola, Mundo").font(.headline)
          Text("Hola, Mundox").font(.largeTitle)
      }
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
