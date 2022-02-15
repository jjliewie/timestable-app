//
//  ContentView.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/7/21.
//

import SwiftUI

struct bestButton2: ButtonStyle {
    
    var radius: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("blackBrown"))
//            .font(Font.custom("CarroisGothicSC-Regular", size: 30))
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.gradColor_bluePink)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct SimpleButtonStyle2: ButtonStyle {
    
    var radius: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.gradColor_pink)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.15 : 1.0)
    }
}

struct ContentView: View {
    
    @AppStorage("totalSolved") var total_solved: Int = 0
    @State private var showLevels = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showStages = false
    @State private var showPb = false
    @State private var showSettings = false
    
    func concatenate(a : Text, b: Text, c: Text, d: Text) -> Text {
        return a + b + c + d
     } // concatenate

    var body: some View {
        
        NavigationView{
            
            GeometryReader { g in
                
            let crad = CGFloat(g.size.height*0.035)

            ZStack{

                Color.gradColor_bluePink
                    .ignoresSafeArea(.all)

                VStack{

                    Spacer()

                HStack{

                        VStack(alignment: .leading){
                            Text("Welcome to")
                                .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.02 + g.size.height*0.028))
                                .foregroundColor(Color("blackBrown"))

                            Text("Times Table World")
                                .font(Font.custom("Ubuntu-Bold", size: g.size.width*0.02 + g.size.height*0.028))
                                .foregroundColor(Color("blackBrown"))

                        }
                        .padding(.leading, g.size.width*0.12)

                        Spacer()
                }

                    Spacer()
                    
                    VStack(alignment:.leading, spacing: g.size.height*0.04){

                            HStack(spacing: g.size.width*0.08){

                                Button(action: {
                                    // sound
                                    SoundManager.instance.playNext()
                                    // sound end
                                    self.showLevels = true
                                }){
                                    Text("Learn")
                                        .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.012 + g.size.height*0.035))
                                        .padding(.vertical, g.size.height*0.027)
                                        .padding(.horizontal, g.size.width*0.05)

                                }
                                .buttonStyle(SimpleButtonStyle2(radius: crad))
                                .fullScreenCover(isPresented: $showLevels) {
                                    LevelsView(isPresented: $showLevels)
                                }

                                VStack(alignment:.leading, spacing:5){

                                    Text("1~19")
                                    Text("Times Table")

                                }
                                    .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.015 + g.size.height*0.025))
                                    .foregroundColor(Color("blackBrown"))
                                    .multilineTextAlignment(.leading)

                            }


                        HStack(spacing: g.size.width*0.08){

                                Button(action: {
                                    // sound
                                    SoundManager.instance.playNext()
                                    // sound end
                                    self.showStages = true
                                }){
                                    Text(" Test ")
                                        .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.012 + g.size.height*0.035))
                                        .padding(.vertical, g.size.height*0.027)
                                        .padding(.horizontal, g.size.width*0.05)
                                }
                                .buttonStyle(SimpleButtonStyle2(radius: crad))
                                .fullScreenCover(isPresented: $showStages) {
                                    StagesView()
                                }

                                VStack(alignment:.leading, spacing: 5){

                                    Text("Test Your")
                                    Text("Skills!")

                                }
                                .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.015 + g.size.height*0.025))
                                .foregroundColor(Color("blackBrown"))
                                .multilineTextAlignment(.leading)

                            } // HStack

                        } // VStack
                    
                    Spacer()

                    VStack(alignment: .leading, spacing: g.size.height*0.025){

                        Text("DASHBOARD")
                            .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.008 + g.size.height*0.035))
                            .foregroundColor(Color("blackBrown"))
                            .multilineTextAlignment(.center)

                        HStack(spacing: (g.size.width*0.02 + g.size.height*0.02)){

                            Text("Problems Solved")
                                .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.02 + g.size.height*0.02))
                                .foregroundColor(Color("blackBrown"))
                                .multilineTextAlignment(.center)

                            Text(String(total_solved))
                                .font(Font.custom("Ubuntu-Bold", size: g.size.width*0.025 + g.size.height*0.02))
                                .foregroundColor(Color("blackBrown"))
                                .multilineTextAlignment(.center)

                        } // HStack


                        Button(action: {
                            // sound
                            SoundManager.instance.playDefault()
                            // sound end
                            self.showPb = true
                        }){
                            Text("See Personal Bests")
                                .font(Font.custom("Ubuntu-Medium", size: g.size.width*0.015 + g.size.height*0.02))
                                .padding(g.size.width*0.002 + g.size.height*0.03)
                        }
                        .buttonStyle(bestButton2(radius: crad))
                        .fullScreenCover(isPresented: $showPb) {
                            PbView()
                        }

                    } // VStack
                    .padding((g.size.width*0.02 + g.size.height*0.02))
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gradColor_bluePink)
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
                    )

                    Spacer()


                } // VStack

            } // ZStack
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
                
            } // geometry
            
        } // Naview
        .navigationViewStyle(StackNavigationViewStyle())

    } // body
} // view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//
//        ContentView()
//            .previewDevice("iPhone 8")
//
//        ContentView()
//            .previewDevice("iPad (8th generation)")
    }
}
