//
//  DescriptionView.swift
//  pokematch
//
//  Created by Ario Syahputra on 24/03/23.
//

import SwiftUI

struct pokemonCharacter{
    var image: String
    var name: String
    var description: String
    
}

func createPokemonCharacter(image: String, name: String, description: String) -> pokemonCharacter {
    return pokemonCharacter(image: image, name: name, description: description)
}

let bulbasaur = createPokemonCharacter(image: "bulbasaur", name: "Bulbasaur", description: "HOBI MAKAN!, Hehe canda..\nTeman-teman menganggap kamu sebagai orang yang cinta damai. Tapi, bisa juga dibilang orang yang nyari aman... soalnya kamu cenderung mengikuti apa kata orang.\n")

let charmander = createPokemonCharacter(image: "charmander", name: "Charmander", description: "KEBAKAR!, canda gais..\nEnergi kamu membuat suasana akademi lebih cerah. Tapi nih, kamu harus tau kalau teman-teman dapat dengan mudah menebak perasaan kamu. Jadi, jangan lupa istirahat yaa biar mood kamu ga ancur.")

let squirtle = createPokemonCharacter(image: "squirtle", name: "Squirtle", description: "Kamu mudah adaptasi dalam lingkungan manapun. Teman-teman merasa kamu tuh orang yang baik hati dan rela menolong. Tapi nih, bagi beberapa orang, kamu terkesan naif. Jadi, tiati yaa kalo crita sama orang.\nCanda.. tapi serius..")


struct DescriptionView: View {
    @Binding var currentScreen: displayScreen
    @Binding var userName: String
    @Binding var yesCounter: Int
    @Binding var noCounter: Int
    
    var pokemon: pokemonCharacter {
        if yesCounter > noCounter {
            return bulbasaur
        } else if noCounter > yesCounter {
            return charmander
        } else {
            return squirtle
        }
    }
    

    
    var body: some View {
        ZStack{
            VStack{
                Text("\(userName),\nSelamat Berpetualang 🏔️").multilineTextAlignment(.leading)
                .font(.system(size:24))
                .fontWeight(.bold).padding(.bottom,20)
               
                VStack{
                    
                    Text("Pokemon bestie kamu adalah..")
                        .font(.system(size: 20)).multilineTextAlignment(.center
                        )
                        .fontWeight(.semibold)
                        .padding(.top,30).padding(.horizontal,25)
                    
                    Image(pokemon.image)
                        .resizable()
                        .frame(width: 120, height: 120).padding(.top, 15)
                    
                    Text("\(pokemon.name)!")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.top,20)
                    
                    Text(pokemon.description)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,25).padding(.vertical,5)
                    
                    Text("Jangan lupa selfie sama teammate kamu ya!")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center).fontWeight(.semibold)
                        .padding(.horizontal,40).padding(.vertical,5).padding(.bottom,20)
                    
                    
                }
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray).opacity(0.3))
                .cornerRadius(20)
            
                Button{
                    withAnimation{
                        currentScreen = .homeView
                        userName = ""
                        yesCounter = 0
                        noCounter = 0
                    }
                    
                } label: {
                    Text("Cobain Lagi").frame(width: 150, height: 50)
                }.buttonStyle(.borderless).background(Color(hex: "4BAE4F")).cornerRadius(13).frame(width: 550, height: 44).foregroundColor(.white).padding(.top,35)
                

            }
            
            .padding(45)
            
            
        }
        .background(Image("Background").ignoresSafeArea(.all))
    }
    
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(currentScreen: .constant(.descriptionView), userName: .constant("jojo"),yesCounter: .constant(7),noCounter: .constant(5))
    }
}

