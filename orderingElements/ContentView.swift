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
  var body: some View{
    sizeClassView()
  }
}

struct sizeClassView: View{
  /** Valores de entorno o environmentValues */
  @Environment(\.horizontalSizeClass) var hSizeClass
  @Environment(\.verticalSizeClass) var vSizeClass
  
  var body: some View{
    if hSizeClass == .compact && vSizeClass == .regular {
      compactDesign()
    }else {
      regularDesign()
    }
  }
}

struct compactDesign: View{
  
  let number = "912345678"
  let message = "¡Hola!👋 Necesito más información."
  
  func sendMessage(){
    let sms = "sms:\(number)&body=\(message)"
    guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) else { return }
    UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
  }
  
  func sendCall(){
    guard let numberSend = URL(string: "tel://\(number)") else { return }
    UIApplication.shared.open(numberSend)
  }
  
  var body: some View{
    ZStack{
      Color.teal.edgesIgnoringSafeArea(.all)
      VStack{
       /** Image("icon-futurama-bender")
          .resizable()
          .frame(width: 144, height: 144, alignment: .center)
          .clipShape(Circle()) **/
        Image(systemName:"person.crop.circle")
          .font(.system(size: 100, weight: .bold))
          .foregroundColor(.blue)
        Text("Blender B. Rodríguez")
          .bold()
          .foregroundColor(.white)
          .font(.largeTitle)
        Text("Futurama,#123")
          .italic()
          .foregroundColor(.white)
          .font(.title)
        HStack{
          Button {
            sendCall()
          } label: {
            Image(systemName:"phone.fill")
              .modifier(buttonModifier(color: Color.green))
          }
          Button {
            sendMessage()
          } label: {
            Image(systemName:"message.fill")
              .modifier(buttonModifier(color: Color.blue))
          }

        }
      }
    }
  }
}

struct regularDesign: View{
  var body: some View{
    ZStack{
      Color.orange.edgesIgnoringSafeArea(.all)
      HStack{
        Image("icon-futurama-bender")
          .resizable()
          .frame(width: 144, height: 144, alignment: .center)
          .clipShape(Circle())
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

struct buttonModifier: ViewModifier{
  var color: Color
  func body(content: Content) -> some View {
    content
      .padding()
      .background(color)
      .clipShape(Circle())
      .foregroundColor(Color.white)
      .font(.title)
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
