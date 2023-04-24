//
//  HomeView.swift
//  pokematch
//
//  Created by Ario Syahputra on 24/03/23.
//

import SwiftUI


struct HomeView: View {
    
    @Binding var currentScreen: displayScreen
    @Binding var userName: String
    @State private var showAlert: Bool = false
    @State var Poke : String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var timer: Timer?
    
    var body: some View {
            
            ZStack{
                

                VStack {
                    
//                    Image("Artwork_Homepage")
//                                .resizable()
//                                .scaledToFit().frame(width: 400, height: 370).padding(.top,30)
                    VStack{
                        Image(Poke)
                        .resizable().scaledToFit()
                        .frame(width:450, height:300)
                        .padding(.top,60).onAppear(perform: timerPoke)
                    }
                    
                    
                    Text("Temukan Pokemon Bestiemu\nBerdasarkan Sifatmu!")
                        .font(.system(size: 24)).fontWeight(.bold).padding(.top,20).multilineTextAlignment(.center)
                    
                    TextField("Masukan nama kamu..", text: $userName).multilineTextAlignment(.center)
                        .frame(width: 230, height: 20)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.all)
                        .background(.white)
                        .cornerRadius(13)
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray).opacity(0.15)).padding(.top,10)
                    
                    Button{
                        if userName.isEmpty {
                            showAlert = true
                        } else {
                            withAnimation{
                                currentScreen = .questionView
                            }
                        }
                    
                    } label: {
                        Text("Yuk Mainkan").frame(width: 150, height: 50)
                    }.buttonStyle(.borderless).background(Color(hex: "4BAE4F")).cornerRadius(13).frame(width: 550, height: 44).foregroundColor(.white).padding(.top,30)
                    
                    Spacer()
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Nama tidak boleh kosong"),
                        dismissButton: .default(Text("OK"))
                                        
                    )
                
                }
                .background(Image("Background").scaledToFit().ignoresSafeArea(.all))
               
            }
        .colorScheme(.light)
        
        }
    
    func timerPoke(){
        var index = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { (Timer) in
            
            Poke = "Poke\(index)"
            index += 1
            
            if (index > 120){
                index = 0
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






