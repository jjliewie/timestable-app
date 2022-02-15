//
//  LevelsView.swift
//  timestable-final
//
//  Created by julie rhee on 2021/11/12.
//

import SwiftUI

struct numberButton: ButtonStyle {
    
    var frame_size : Double
    var text_size : Double
    var text : String
    var corner : Double
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: CGFloat(frame_size), height: CGFloat(frame_size))
            .overlay(
                Text(text)
                    .font(Font.custom("Ubuntu-Medium", size: CGFloat(text_size)))
                .foregroundColor(Color("blackBrown"))
                .background(
                    RoundedRectangle(cornerRadius: CGFloat(corner))
                        .fill(Color.gradColor_lightPink)
                        .frame(width: CGFloat(frame_size), height: CGFloat(frame_size))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
            )
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct LevelsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showNext = false
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
        
        NavigationView{
        
        ZStack{
            
            Color("seaFoam")
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                Text("Learn Levels 2-10")
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
                        reset(num: 2)
                        strLevel = "Two"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×2", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 3)
                        strLevel = "Three"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×3", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 4)
                        strLevel = "Four"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×4", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }

                }
                
                HStack(spacing:g.size.height*0.025){
                    Button(action: {
                        reset(num: 5)
                        strLevel = "Five"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×5", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 6)
                        strLevel = "Six"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×6", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 7)
                        strLevel = "Seven"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×7", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }

                }
                
                HStack(spacing:g.size.height*0.025){
                    
                    
                    Button(action: {
                        reset(num: 8)
                        strLevel = "Eight"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×8", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 9)
                        strLevel = "Nine"
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×9", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    Button(action: {
                        reset(num: 10)
                        strLevel = "Ten"
                        
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×10", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }

                }
                
//                HStack(spacing:58){
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
                        strLevel = "11"
                        reset(num: 11)
                    }){
                        Color.clear
                    }
                    .buttonStyle(numberButton(frame_size: Double(g.size.height)*0.108, text_size: Double(g.size.height)*0.04, text: "×11", corner: Double(g.size.height)*0.037))
                    .fullScreenCover(isPresented: $showTable) {
                            LearnView(isPresented: $showTable)
                    }
                    
                    
                    NavigationLink(destination: LevelsView2(isPresented: $isPresented)){
                        Color.clear
                            .frame(width: g.size.height*0.108, height: g.size.height*0.108)
                            .overlay(
                                Image(systemName: "arrow.right")
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
                    } // navigation link
                    .simultaneousGesture(TapGesture().onEnded{
                        SoundManager.instance.playNext()
                    })
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                }
                
            }
                
                Spacer()
                
                VStack{
                    Text("Study First,")
                    Text("Test Your Skills Later!")
                }
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Ubuntu-Medium", size: g.size.height*0.03))
                    .foregroundColor(Color("blackBrown"))
                    .padding(g.size.height*0.025)
                    .background(
                        RoundedRectangle(cornerRadius: g.size.height*0.037)
                            .fill(Color.gradColor_blue)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
                
                Spacer()
                
            } // vstack
            
        } // zstack
        } // navigation
        .navigationViewStyle(StackNavigationViewStyle())
            
        } // geometry
        
    } // body
} // view

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        
        LevelsView(isPresented: .constant(true))
    }
}
