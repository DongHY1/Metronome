//
//  ContentView.swift
//  Metronome
//
//  Created by Masahiro on 2024/1/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetronomeActive = false
    @State private var metronomeSpeed = 120.0
    var body: some View {
        NavigationStack{
            List {
                Section{
                    Toggle("Open Metronome",isOn: $isMetronomeActive)
                        .toggleStyle(SwitchToggleStyle())
                        .padding()
                    Stepper("Speed: \(metronomeSpeed) BPM", value: $metronomeSpeed, in: 40...240)
                        .padding()
                }
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    ContentView()
}
