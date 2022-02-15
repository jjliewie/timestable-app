//
//  StagesView.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/8/21.
//

import SwiftUI

struct StagesButton: ButtonStyle {
    
    var size: CGFloat
    var padding1: CGFloat
    var padding2: CGFloat
    var crad: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("navy"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .padding(padding1) // 20
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.gradColor_blue)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
            .padding(padding2) // 10
    }
}

struct pbButton: ButtonStyle {
    
    var size: CGFloat
    var padding1: CGFloat
    var padding2: CGFloat
    var crad: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .font(Font.custom("Ubuntu-Medium", size: 30))
            .foregroundColor(Color("navy"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 25
            .padding(padding1) // 20
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
            .padding(padding2) // 10
    }
}

struct HomeButton: ButtonStyle {
    
    var size: CGFloat
    var padding1: CGFloat
    var padding2: CGFloat
    var crad: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .font(Font.custom("Ubuntu-Medium", size: 30))
            .foregroundColor(Color("navy"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 25
            .padding(padding1) // 20
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
            .padding(padding2) // 10
    }
}

struct StagesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showBest = false
    @State private var showTest = false
    
    func setstage(num: Int){
        stage = num
        time_spent = "0.0"
        correct = 0
        test_question = 1
        personal_best = false
        self.showTest = true
    }
    
    var body: some View {
        
        NavigationView{
            
        GeometryReader { g in
            
            let button_padding1 = CGFloat(g.size.height*0.025)
            let button_padding2 = CGFloat(g.size.height*0.015)
            let radius = CGFloat(g.size.height*0.035)
            let button_text = CGFloat(g.size.height*0.036)
            let title_text = CGFloat(g.size.height*0.036)
            let title_padding1 = CGFloat(g.size.height*0.01)
            let title_padding2 = CGFloat(g.size.height*0.07)
            let pb_text = CGFloat(g.size.height*0.032)
            let pb_padding1 = CGFloat(g.size.height*0.025)
            let pb_padding2 = CGFloat(g.size.height*0.01)
            let home_text = CGFloat(g.size.height*0.032)
            let home_padding1 = CGFloat(g.size.height*0.025)
            let home_padding2 = CGFloat(g.size.height*0.015)
            let d_size = CGFloat(g.size.height*0.031)
            let d_padding = CGFloat(g.size.height*0.02)
            
            ZStack{
                
                Color.offWhite
                    .ignoresSafeArea(.all)
                
                VStack{
                    
                    Spacer()
                    
                    HStack{
                                            
                            VStack(alignment: .leading){
                                Text("Stages")
                                    .font(Font.custom("Ubuntu-Bold", size: title_text))
                                    .foregroundColor(Color("navy"))
                                    .padding(.bottom, title_padding1)

                                Text("Test your skills!")
                                    .font(Font.custom("Ubuntu-Medium", size: title_text))
                                    .foregroundColor(Color("navy"))

                            }
                            .padding(.leading, title_padding2)
                        
                            Spacer()
                    }

                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            
                            Button(action: {
                                SoundManager.instance.playNext()
                                setstage(num: 1)
                            }){
                                Text("stage 1")
                            }
                            .buttonStyle(StagesButton(size: button_text, padding1: button_padding1, padding2: button_padding2, crad: radius))
                            .fullScreenCover(isPresented: $showTest) {
                                TestView(isPresented: $showTest)
                            }
                            
                            VStack(alignment:.leading){
                                
                                Text("2 ~ 9")
                                Text("times table")
                                
                            
                            } // VStack
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: d_size))
                            .padding(d_padding)
                            
                            
                        } // HStack
                        
                        HStack{
                            
                            Button(action: {
                                SoundManager.instance.playNext()
                                setstage(num: 2)
                            }){
                                Text("stage 2")
                            }
                            .buttonStyle(StagesButton(size: button_text, padding1: button_padding1, padding2: button_padding2, crad: radius))
                            .fullScreenCover(isPresented: $showTest) {
                                TestView(isPresented: $showTest)
                            }
                            
                            VStack(alignment:.leading){
                                
                                Text("9 ~ 12")
                                Text("times table")
                                
                            
                            } // VStack
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: d_size))
                            .padding(d_padding)
                            
                        } // HStack
                        
                        HStack{
                            
                            Button(action: {
                                SoundManager.instance.playNext()
                                setstage(num: 3)
                            }){
                                Text("stage 3")
                            }
                            .buttonStyle(StagesButton(size: button_text, padding1: button_padding1, padding2: button_padding2, crad: radius))
                            .fullScreenCover(isPresented: $showTest) {
                                TestView(isPresented: $showTest)
                            }
                            
                            VStack(alignment:.leading){
                                
                                Text("12 ~ 19")
                                Text("times table")
                                
                            
                            } // VStack
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: d_size))
                            .padding(d_padding)

                            
                        } // HStack
                        
                        HStack{
                            
                            Button(action: {
                                SoundManager.instance.playNext()
                                setstage(num: 4)
                            }){
                                Text("stage 4")
                            }
                            .buttonStyle(StagesButton(size: button_text, padding1: button_padding1, padding2: button_padding2, crad: radius))
                            .fullScreenCover(isPresented: $showTest) {
                                TestView(isPresented: $showTest)
                            }
                            
                            VStack(alignment:.leading){
                                
                                Text("2 ~ 19")
                                Text("times table")
                                
                            
                            } // VStack
                            .foregroundColor(Color("navy"))
                            .font(Font.custom("Ubuntu-Medium", size: d_size))
                            .padding(d_padding)

                            
                        } // HStack
                        
                    } // VStack

                    
                    Spacer()

                        
                    Button(action: {
                        SoundManager.instance.playNext()
                        self.showBest = true
                    })
                    {
                        HStack{
                            Text("see personal bests")
                            Image(systemName: "star.circle")
                        }
                    }
                    .buttonStyle(pbButton(size: pb_text, padding1: pb_padding1, padding2: pb_padding2, crad: radius))
                    .fullScreenCover(isPresented: $showBest) {
                        PbView()
                    }

                    Button(action: {
                        SoundManager.instance.playNext()
                        presentationMode.wrappedValue.dismiss()
                    }){
                        HStack{
                            Text("back to home")
                            Image(systemName: "house")
                        } // HStack
                        
                    }
                    .buttonStyle(HomeButton(size: home_text, padding1: home_padding1, padding2: home_padding2, crad: radius))
                    
                    Spacer()
                    
                } // VStack
                
            } // ZStack
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
        } // geometry view
            
        } // Nav View
        .navigationViewStyle(StackNavigationViewStyle())
        
    } // body
} // view

struct StagesView_Previews: PreviewProvider {
    static var previews: some View {
        
        StagesView()
        
    }
}

