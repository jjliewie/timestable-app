//
//  ResultView.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/8/21.
//

import SwiftUI

struct ResultBackButton: ButtonStyle {
    var size : CGFloat
    var padding : CGFloat
    var crad : CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("navy"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: 25)) // 25
            .padding(20) // 20
            .background(
                RoundedRectangle(cornerRadius: 30) // 30
                    .fill(Color.gradColor_blue)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}


extension Color {
    
    static let gradColor_coral = LinearGradient(Color("salmon"), Color("coral"))
}

struct ResultView: View {
    
    @Binding var isPresented : Bool
    
    func concatenate(a : Text, b: Text, c: Text, d: Text) -> Text {
        return a + b + c + d
     } // concatenate
    
    var body: some View {
        
        GeometryReader { g in
                        
            let radius1 = CGFloat(g.size.height*0.035)
            let radius2 = CGFloat(g.size.height*0.03)
            let title_text = CGFloat(g.size.height*0.04)
            let title_padding = CGFloat(g.size.height*0.06)
            let check_mark = CGFloat(g.size.height*0.045)
            let result_text = CGFloat(g.size.height*0.038)
            let description = CGFloat(g.size.height*0.03)
            let description_padding = CGFloat(g.size.height*0.026)
            let wrong_text1 = CGFloat(g.size.height*0.035)
            let wrong_text2 = CGFloat(g.size.height*0.037)
            let wrong_padding1 = CGFloat(g.size.height*0.04)
            let wrong_padding2 = CGFloat(g.size.height*0.026)
            let wrong_padding3 = CGFloat(g.size.height*0.028)
            let wrong_padding4 = CGFloat(g.size.height*0.045)
            let wrong_padding5 = CGFloat(g.size.height*0.03)
            let wrong_padding6 = CGFloat(g.size.height*0.036)
            let wrong_spacing = CGFloat(g.size.height*0.025)
            let block_padding = CGFloat(g.size.height*0.05)
            let back_text = CGFloat(g.size.height*0.04)
            let back_padding = CGFloat(g.size.height*0.03)
            let thumb_frame = CGFloat(g.size.height*0.2)
        
        ZStack{
            
            Color.gradColor_blue
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                HStack{
                                        
                        VStack(alignment: .leading){
                            Text("Your learning ")
                                .font(Font.custom("Ubuntu-Medium", size: title_text))
                                .foregroundColor(Color("navy"))

                            Text("Results")
                                .font(Font.custom("Ubuntu-Bold", size: title_text))
                                .foregroundColor(Color("navy"))

                        }
                        .padding(.leading, title_padding)
                    
                        Spacer()
                }
                
                Spacer()

        
                VStack{
                    
                    if(need_review == []){
                        
                        HStack{
                            Text("Perfect!")
                                .font(Font.custom("Ubuntu-Bold", size: result_text))
                                .foregroundColor(Color.offWhite)
                            
                            
                            Image(systemName: "checkmark.seal")
                                .font(Font.custom("Ubuntu-Bold", size: check_mark))
                                .foregroundColor(Color.offWhite)
                        }
                        .padding()
                        .padding(.top)
                        
                        
                        Text("You've mastered the " + strLevel + " Times Table!\nThere is nothing to review!")
                        
                            .font(Font.custom("Ubuntu-Bold", size: description))
                            .foregroundColor(Color.offWhite)
                            .padding(description_padding)
                            .overlay(
                                RoundedRectangle(cornerRadius: radius2)
                                    .stroke(Color.gradColor_blue, lineWidth: 4)
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                            )
                            .padding([.leading, .trailing, .bottom], description_padding)
                        
                    }
                    
                    
                    else{
                        
                        VStack(alignment:.leading){
                            
                            HStack{
                                Text("Products")
                                    .font(Font.custom("Ubuntu-Bold", size: wrong_text1))
                                    .foregroundColor(Color.offWhite)
                                    .padding(.top, wrong_padding6)
                               Spacer()
                            }
                            HStack{
                                Text("You Should Review")
                                    .font(Font.custom("Ubuntu-Bold", size: wrong_text1))
                                    .foregroundColor(Color.offWhite)
                                Spacer()
                            }
                            
                        }
                        .padding(.leading, block_padding)
 
                        
                        
                        ScrollView(.horizontal) {
                            HStack(alignment: .center, spacing: wrong_spacing) {
                                ForEach(need_review, id: \.self) { q in
                                    Text(String(level) + "×" + String(q))
                                        .font(Font.custom("Ubuntu-Bold", size: wrong_text2))
                                        .foregroundColor(Color("navy"))
                                        .padding(wrong_padding2)
                                        .background(
                                            RoundedRectangle(cornerRadius: radius1)
                                                .fill(Color.gradColor_blue)
                                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                                        )
                                        .padding([.top, .bottom], wrong_padding3)
                                        .padding(.trailing, wrong_padding2)
                                }
                            }
                            .padding(.leading,wrong_padding1)

                        }
                        .background(
                            RoundedRectangle(cornerRadius: radius2)
                                .fill(Color.offWhite)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: radius2)
                                .stroke(Color.gradColor_coral, lineWidth: 7)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        )
                        .padding([.horizontal, .bottom], wrong_padding4)
                        .padding(.top, wrong_padding5)
                        
                        
                    }
                }//VStack
                .background(
                    RoundedRectangle(cornerRadius: radius2)
                        .fill(Color.gradColor_pink)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
                .padding([.leading, .trailing],block_padding)
                
                Spacer()

                
                Image(systemName:"hand.thumbsup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: thumb_frame, height: thumb_frame)
                    .foregroundColor(Color.offWhite)
                
                Spacer()
                
                // back button
                
                Button(action: {
                    // sound
                    SoundManager.instance.playNext()
                    // sound end
                    isPresented = false
                }){
                    Text("back to levels")
                }
                .buttonStyle(ResultBackButton(size: back_text, padding: back_padding, crad: radius1))
                
                Spacer()
                                
            }// VStack
            
            
        }// ZStack
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
            
        } // geometry reader
        
    }// body
}// view

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isPresented: .constant(true))
    }
}

