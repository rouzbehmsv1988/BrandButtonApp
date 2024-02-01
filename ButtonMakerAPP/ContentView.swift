//
//  ContentView.swift
//  ButtonMakerAPP
//
//  Created by rouzbeh on 01.02.24.
//

import SwiftUI
import BrandButton

//This entire file is made for example of how the button is responsive to different Styles
struct ButtonContainerStyle {
    var style: ButtonStyles
    var mode: ButtonModes
    var color: ButtonColor
    var isDisabled: Bool
    static var defaultStyle = ButtonContainerStyle(style: .leading, mode: .primary, color: .blue, isDisabled: false)
}

// Enumeration for predefined button colors. Used Corrently only for testing purpose
enum ButtonColor: String, CaseIterable, Identifiable {
    case blue = "Blue"
    case green = "Green"
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .blue: return Color("DarkBlue")
        case .green: return Color("DarkGreen") // Assuming you've defined "VeryDarkGreen" in your asset catalog
        }
    }
}

// Current Testing View
struct ContentView: View {
    @State private var shouldAnimate = false
    @State private var style: ButtonContainerStyle = ButtonContainerStyle.defaultStyle
    @State private var navigateToBrandButton = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Button Style", selection: $style.style) {
                    Text("Leading").tag(ButtonStyles.leading)
                    Text("Trailing").tag(ButtonStyles.trailing)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Picker("Button Mode", selection: $style.mode) {
                    Text("Primary").tag(ButtonModes.primary)
                    Text("Secondary").tag(ButtonModes.secondary)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Picker("Button Color", selection: $style.color) {
                    ForEach(ButtonColor.allCases) { color in
                        Text(color.rawValue).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Toggle(isOn: $style.isDisabled) {
                    Text("Is Disabled")
                }.padding()
                
                NavigationLink("Create button") {
                    BrandButtonContainerView(style: $style)
                }
                
            }
        }
    }
}


// Your BrandButton and related code follows here...

#Preview {
    ContentView()
}
