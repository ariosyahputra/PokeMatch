//
//  ContentView.swift
//  pokematch
//
//  Created by Ario Syahputra on 24/03/23.
//

import SwiftUI

enum displayScreen{
    case homeView
    case questionView
    case descriptionView
    
}



struct ContentView: View {
    @State var currentScreen: displayScreen = .homeView
    @State var userName: String = ""
    @State var yesCounter: Int = 0
    @State var noCounter: Int = 0
    
    var body: some View {
            
        if currentScreen == .homeView{
            HomeView(currentScreen: $currentScreen, userName: $userName).preferredColorScheme(.light)
        }else if currentScreen == .questionView{
            QuestionView(currentScreen: $currentScreen,userName: $userName,yesCounter: $yesCounter,noCounter: $noCounter).preferredColorScheme(.light)
        }else if currentScreen == .descriptionView{
            DescriptionView(currentScreen: $currentScreen, userName: $userName,yesCounter: $yesCounter,noCounter: $noCounter).preferredColorScheme(.light)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}





