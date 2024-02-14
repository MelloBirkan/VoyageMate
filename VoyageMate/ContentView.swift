//
//  ContentView.swift
//  VoyageMate
//
//  Created by Marcello Gonzatto Birkan on 14/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Query var destination: [Destination]
  
  var body: some View {
    Text("Hello")
  }
}
  
  #Preview {
    ContentView()
  }
