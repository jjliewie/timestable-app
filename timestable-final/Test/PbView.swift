//
//  PbView.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/8/21.
//

import SwiftUI

struct BackBestButton: ButtonStyle {
    
    var size : CGFloat
    var padding1 : CGFloat
    var padding2 : CGFloat
    var crad : CGFloat
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .font(Font.custom("Ubuntu-Medium", size: 30))
            .foregroundColor(Color("navy"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .padding(padding1) // 20
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.15 : 1.0)
            .padding(padding2) // 10
    }
}

struct PbView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("personalTime1") var personal_time_1: Double = 0.0
    @AppStorage("personalAccuracy1") var personal_accuracy_1: Double = 0.0
    @AppStorage("personalTime2") var personal_time_2: Double = 0.0
    @AppStorage("personalAccuracy2") var personal_accuracy_2: Double = 0.0
    @AppStorage("personalTime3") var personal_time_3: Double = 0.0
    @AppStorage("personalAccuracy3") var personal_accuracy_3: Double = 0.0
    @AppStorage("personalTime4") var personal_time_4: Double = 0.0
    @AppStorage("personalAccuracy4") var personal_accuracy_4: Double = 0.0
    
    var body: some View {
        
        GeometryReader { g in
            
            let radius = CGFloat(g.size.height*0.035)
            let title_text = CGFloat(g.size.height*0.04)
            let title_padding = CGFloat(g.size.height*0.06)
            let v_spacing = CGFloat(g.size.height*0.035)
            let stage_text = CGFloat(g.size.height*0.03)
            let stage_padding = CGFloat(g.size.height*0.025)
            let back_text = CGFloat(g.size.height*0.038)
            let back_padding1 = CGFloat(g.size.height*0.025)
            let back_padding2 = CGFloat(g.size.height*0.008)
            let data_text = CGFloat(g.size.height*0.026)
            let fix_padding = CGFloat(g.size.height*0.01)
        
        ZStack{
            
            Color.offWhite
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                HStack{
                    Text("Personal Bests")
                        .font(Font.custom("Ubuntu-Bold", size: title_text))
                        .foregroundColor(Color("navy"))
                        .multilineTextAlignment(.center)
                        .padding(.leading, title_padding)
                    Spacer()
                }
                    
                Spacer()
                
                VStack(spacing: v_spacing){
                    
                    HStack{
                        
                        Text("Stage 1")
                            .padding(.trailing)
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: stage_text))
                            
                        
                        VStack(alignment:.leading){
                            
                            Text("Accuracy: " + String(personal_accuracy_1) + "%")
                                .padding(.bottom, fix_padding)
                            Text("Time: " + String(personal_time_1) + " seconds")
                            
                        } // VStack
                        .foregroundColor(Color("navy"))
                        .font(Font.custom("Ubuntu-Medium", size: data_text))
                        
                    } // HStack
                    .padding(stage_padding)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                    )
                    
                    HStack{
                        
                        Text("Stage 2")
                            .padding(.trailing)
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: stage_text))
                            
                        
                        VStack(alignment:.leading){
                            
                            Text("Accuracy: " + String(personal_accuracy_2) + "%")
                                .padding(.bottom, fix_padding)
                            Text("Time: " + String(personal_time_2) + " seconds")
                            
                        } // VStack
                        .foregroundColor(Color("navy"))
                        .font(Font.custom("Ubuntu-Medium", size: data_text))
                        
                    } // HStack
                    .padding(stage_padding)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                    )
                    
                    HStack{
                        
                        Text("Stage 3")
                            .padding(.trailing)
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: stage_text))
                            
                        
                        VStack(alignment:.leading){
                            
                            Text("Accuracy: " + String(personal_accuracy_3) + "%")
                                .padding(.bottom, fix_padding)
                            Text("Time: " + String(personal_time_3) + " seconds")
                            
                        } // VStack
                        .foregroundColor(Color("navy"))
                        .font(Font.custom("Ubuntu-Medium", size: data_text))
                        
                    } // HStack
                    .padding(stage_padding)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                    )
                    
                    HStack{
                        
                        Text("Stage 4")
                            .padding(.trailing)
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: stage_text))
                            
                        
                        VStack(alignment:.leading){
                            
                            Text("Accuracy: " + String(personal_accuracy_4) + "%")
                                .padding(.bottom, fix_padding)
                            Text("Time: " + String(personal_time_4) + " seconds")
                            
                        } // VStack
                        .foregroundColor(Color("navy"))
                        .font(Font.custom("Ubuntu-Medium", size: data_text))
                        
                    } // HStack
                    .padding(stage_padding)
                    .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                    )
                    
                }
                
                Spacer()
                
                Button(action: {
                    // sound
                    SoundManager.instance.playNext()
                    // sound end
                    presentationMode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image(systemName: "arrow.down")
                        Text("back")
                    }
                }
                .buttonStyle(BackBestButton(size: back_text, padding1: back_padding1, padding2: back_padding2, crad: radius))
                
                Spacer()
            
            } // VStack
            
        } // ZStack
//        .navigationBarTitle("")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
        } // geometry
    } // body
} // view

struct PbView_Previews: PreviewProvider {
    static var previews: some View {
        PbView()
    }
}
