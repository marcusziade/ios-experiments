//
//  SmartListPrototype.swift
//  ios-exoeriments
//
//  Created by Marcus Ziadé on 28.11.2021.
//

import SwiftUI

struct SmartListPrototype: View {
    var body: some View {
        List {
            Section {
                Toggle("Smart shortcuts", isOn: .constant(true))
            }
            
            Section("Active") {
                ForEach(0..<3) { item in
                    Text("Active option \(item)")
                }
            }
            
            Section {
                ForEach(0..<6) { item in
                    Text("Option \(item)")
                }
            }
        }
    }
}

struct SmartListPrototype_Previews: PreviewProvider {
    static var previews: some View {
        SmartListPrototype()
            .preferredColorScheme(.dark)
    }
}
