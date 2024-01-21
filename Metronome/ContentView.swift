//
//  ContentView.swift
//  Metronome
//
//  Created by Masahiro on 2024/1/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isMetronomeActive = false
    @State private var metronomeSpeed:Int = 120
    @State private var activeBeat = 0
    @State private var timer: Timer.TimerPublisher?
    let beats = 4
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    Toggle("Open Metronome",isOn: $isMetronomeActive)
                        .toggleStyle(SwitchToggleStyle())
                        .padding()
                    Stepper("\(metronomeSpeed) BPM", value: $metronomeSpeed, in: 40...240)
                        .padding()
                    HStack {
                        ForEach(0..<beats, id: \.self) { beat in
                            Circle()
                                .fill(beat == activeBeat ? Color.red : Color.gray)
                                .frame(width: 30, height: 30)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Metronome")
            .padding()
            .onReceive(Timer.publish(every: 60.0 / Double(metronomeSpeed), on: .main, in: .common).autoconnect()) { _ in
                if isMetronomeActive {
                    activeBeat = (activeBeat + 1) % beats
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
