//
//  CardView.swift
//  TinderSwipe
//
//  Created by KAMAL on 21/03/23.
//

import SwiftUI

struct CardView: View {
    var questionList: String
    @State var offset = CGSize.zero
    @State var color: Color = .white
    @State var fontColor: Color = .black
    @Binding var yesCounter: Int
    @Binding var noCounter: Int
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300, height: 516)
                .cornerRadius(20).shadow(color: .gray, radius: 1, x: 10,y : 10).opacity(1)
                .foregroundColor(color.opacity(1))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray).opacity(0.05))
            HStack {
                Text(questionList)
                    .font(.system(size:20))
                    .foregroundColor(fontColor)
                    .fontWeight(.semibold)
                    .padding()
                
            }
            
            
        }
        .offset(x: offset.width, y:offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    changeFontColor(width: offset.width)
                    withAnimation {
                        changeColor(width: offset.width)
                    }

                } .onEnded {
                    _ in
                    withAnimation{
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                        
                    }
                }
        )
        
    }
    
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(questionList) No")
            noCounter+=1
            print(noCounter)
            offset = CGSize(width:-500, height:0)
        case 150...(500):
            print("\(questionList) Yes")
            yesCounter += 1
            print(yesCounter)
            offset = CGSize(width:500, height:0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat){
        switch width {
        case -500...(-130):
            color = .red
            fontColor = .white
        case 130...(500):
            color = .green
            fontColor = .white
        default:
            color = .white
            fontColor = .black
            
        }
    }
    
    func changeFontColor(width: CGFloat){
        switch width {
        case -500...(-130):
            fontColor = .white
        case 130...(500):
            fontColor = .white
        default:
            fontColor = .black
            
        }
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(questionList: "Question", yesCounter: .constant(5), noCounter: .constant(5))
    }
}
