-//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var num: Double = 50
        
    @State var toggle = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text("0")
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                
                Spacer()
                
                VStack() {
                    Text("Current Level")
                    Text("1")
                }
                .padding(.trailing , 20)
                .padding(.top, 20)
            }
            
            Spacer()
            
            VStack() {
                HStack() {
                    Text("Move the slider to.")
                        .font(.system(size: 30))
                }
                HStack() {
                    Text("\(Int(num))")
                        .font(.system(size: 25))
                }
            }
            VStack() {
                Slider(value: $num, in: 0...100)
            }
            HStack() {
                Button("Check") {
                    print("Button tapped!")
                }.padding(.bottom, 40)
            }
            Spacer()
            VStack() {
                Text("Exact mode?")
            }
            VStack {
                        Toggle("", isOn: $toggle)
                    .padding(.trailing, 175)
                    }
            
            
            
        }
    }
}
