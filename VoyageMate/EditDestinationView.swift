//
//  EditDestinationView.swift
//  VoyageMate
//
//  Created by Marcello Gonzatto Birkan on 14/02/24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
  @Bindable var destination: Destination
  
    var body: some View {
      Form {
        TextField("Name", text: $destination.name)
        TextField("Details", text: $destination.details, axis: .vertical)
        DatePicker("Date", selection: $destination.date)
        
        Section("Priority") {
          Picker("Priority", selection: $destination.priority) {
            Text("Meh").tag(1)
            Text("Maybe").tag(2)
            Text("Must").tag(3)
          }
          .pickerStyle(.segmented)
        }
      }
      .navigationTitle("Edit Destination")
      .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Destination.self, configurations: config)
    let examples = Destination(name: "Example", details: "Example details")
    return EditDestinationView(destination: examples)
      .modelContainer(container)
  } catch {
    fatalError("Failed to create model container")
  }
}
