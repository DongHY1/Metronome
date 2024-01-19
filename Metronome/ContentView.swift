//
//  ContentView.swift
//  Metronome
//
//  Created by Masahiro on 2024/1/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetronomeActive = false
    var body: some View {
        VStack {
            Toggle("Open Metronome",isOn: $isMetronomeActive)
                .toggleStyle(SwitchToggleStyle())
            
            if(isMetronomeActive){
                Text("Metronome")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
