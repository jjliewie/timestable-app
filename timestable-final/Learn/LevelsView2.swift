//
//  LevelsView2.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/18/21.
//

import SwiftUI

struct LevelsView2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showTable = false
    @Binding var isPresented : Bool
    
    func reset(num: Int){
        
        // sound
        SoundManager.instance.playDefault()
        // sound end
        
        level = num
        showTable = true
        need_review = []
        cur_question = 1
        if (num <= 9){
            maxNum = 10
        }
        else{
            maxNum = num+1
        }
        
    } // reset function end
    
    var body: some View {
        
        GeometryReader { g in
        
        ZStack{
            
            Color("seaFoam")
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                Text("Learn Levels 12-19")
                    .font(Font.custom("Ubuntu-Bold", size: (g.size.height*0.03 + g.size.width*0.01)))
                    .foregroundColor(Color("blackBrown"))
                    .padding(g.size.height*0.035)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gradColor_blue)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
                
                    Spacer()

            VStack(spacing:g.size.height*0.025){
                
                HStack(spacing:g.size.height*0.025){
                    Button(action: {
                        strLevel = "12"
                        reset(num: 12)
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×12", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 13)
                        strLevel = "13"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×13", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 14)
                        strLevel = "14"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×14", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }

                }
                
                HStack(spacing:g.size.height*0.025){
                    Button(action: {
                        reset(num: 15)
                        strLevel = "15"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×15", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 16)
                        strLevel = "16"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×16", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        strLevel = "17"
                        reset(num: 17)
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×17", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }

                }
                
                HStack(spacing:g.size.height*0.025){
                    
                    Button(action: {
                        // sound
                        SoundManager.instance.playNext()
                        // sound end
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Color.clear
                            .frame(width: g.size.height*0.108, height: g.size.height*0.108)
                            .overlay(
                                Image(systemName: "arrow.left")
                                .font(Font.custom("Ubuntu-Medium", size: g.size.height*0.04))
                                .foregroundColor(Color("blackBrown"))
                                .background(
                                    RoundedRectangle(cornerRadius: g.size.height*0.037)
                                        .fill(Color.gradColor_lightPink)
                                        .frame(width: g.size.height*0.108, height: g.size.height*0.108)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                )
                            )
                    }
                    
                    Button(action: {
                        reset(num: 18)
                        strLevel = "18"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×18", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 19)
                        strLevel = "19"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×19", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                } //hstack
                
                
            }// vstack
                
                Spacer()
                
                Button(action: {
                    // sound
                    SoundManager.instance.playNext()
                    // sound end
                   isPresented = false
                }){
                    HStack{
                        Text("back to home")
                        Image(systemName: "house")
                    }
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Ubuntu-Medium", size: g.size.height*0.035))
                        .foregroundColor(Color("blackBrown"))
                        .padding(g.size.height*0.025)
                        .background(
                            RoundedRectangle(cornerRadius: g.size.height*0.037)
                                .fill(Color.gradColor_blue)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        )
                }
                
                Spacer()
                
            } // vstack
            
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
            
        } // geometry
    }
}

struct LevelsView2_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView2(isPresented: .constant(true))

    }
}
