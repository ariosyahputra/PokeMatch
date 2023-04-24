//
//  ContentView.swift
//  TinderSwipe
//
//  Created by KAMAL on 21/03/23.
//

import SwiftUI


struct QuestionView: View {
     var questionList: [String] = [
        "Pernah Telat Ga",
        "Nongkrong di lab sampe malem?",
        "Pernah lupa sama loker sendiri?" ,
        "Tiap hari nyiram taneman?",
        "Saling follow sama mentor di sosmed?",
        "Sering makan dikantin?",
        "Gak pernah bikin kopi di pantry",
        "Naksir sama temen di academy?",
        "Naksir sama mentor di academy?",
        "Nongkrong di the breeze habis academy",
        ]
        .shuffled()
    
    @Binding var currentScreen: displayScreen
    @Binding var userName: String
    @Binding var yesCounter: Int
    @Binding var noCounter: Int
    @State var timeCounter: Int = 0
    
    var body: some View {
        
        ZStack{
            VStack {
               
             Text("\(userName),\nSwipe dengan jujur Yah 👇").multilineTextAlignment(.leading).font(.system(size:24)).fontWeight(.bold).padding(.bottom,70)
                
                
                ZStack{
                    HStack{
                                    
                                    Image(systemName: "chevron.left.circle.fill")
                            .resizable().background(.white)
                                        .frame(width:40, height:40)
                                        .clipShape(Circle())
                                        .foregroundColor(Color.red)
                                    Spacer()
                        
    //                    Text("Swipe Kartunya!").frame(width: 200,height: 44).multilineTextAlignment(.leading).font(.system(size:15)).fontWeight(.bold).background(.white).cornerRadius(20)
                                    
                        Image(systemName: "chevron.right.circle.fill").resizable().background(.white)
                                        
                                        .frame(width:40, height:40)
                                        .clipShape(Circle())
                                        .foregroundColor(Color.green)
                                                    

                    }.zIndex(1)
                    
                    if yesCounter + noCounter < 10 {
                        ForEach(questionList, id: \.self) { questionList in CardView(questionList: questionList, yesCounter: $yesCounter, noCounter: $noCounter)
                        }
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 420)
                    } else {
                        VStack{
                        }.onAppear(perform: { withAnimation{
                            currentScreen = .descriptionView
                        }} )
                    }
                }
                .padding(.bottom,100)
                            
                
            }
            .padding()
            
        }
        .background(Image("Background").ignoresSafeArea(.all))
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(currentScreen: .constant(.questionView), userName: .constant("jojo"), yesCounter: .constant(0), noCounter: .constant(0))
    }
}
