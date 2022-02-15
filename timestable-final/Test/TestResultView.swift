//
//  TestResultView.swift
//  timestable-final
//
//  Created by Rhee Julie on 12/8/21.
//

import SwiftUI
import Foundation

struct TestResultBackButton: ButtonStyle {
    
    var size : CGFloat
    var padding : CGFloat
    var crad : CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .foregroundColor(Color("navy"))
//            .font(Font.custom("CarroisGothicSC-Regular", size: 30))
            .padding(padding) // 20
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.gradColor_blue)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct TestResultView: View {
    

    //stage 1

    @AppStorage("personalTime1") var personal_time_1: Double = 0.0
    @AppStorage("personalAccuracy1") var personal_accuracy_1: Double = 0.0

    //stage 2

    @AppStorage("personalTime2") var personal_time_2: Double = 0.0
    @AppStorage("personalAccuracy2") var personal_accuracy_2: Double = 0.0

    //stage 3

    @AppStorage("personalTime3") var personal_time_3: Double = 0.0
    @AppStorage("personalAccuracy3") var personal_accuracy_3: Double = 0.0
    
    //stage 4

    @AppStorage("personalTime4") var personal_time_4: Double = 0.0
    @AppStorage("personalAccuracy4") var personal_accuracy_4: Double = 0.0

    //end appstorage declarations
    
    
    @Binding var isPresented: Bool
    
    let stars : Double = (((Double(correct)*50.0)/Double(total))/10).round(nearest: 0.5)
    
    @State private var accuracy = ((Double(correct)/Double(total)).round(nearest: 0.01))*100.0
    
    var body: some View {
        
        GeometryReader { g in

            let back_size = CGFloat(g.size.height*0.033)
            let back_padding = CGFloat(g.size.height*0.028)
            let cradius = CGFloat(g.size.height*0.035)
            let title_text = CGFloat(g.size.height*0.038)
            let title_padding1 = CGFloat(g.size.height*0.03)
            let title_padding2 = CGFloat(g.size.height*0.05)
            let v_spacing1 = CGFloat(g.size.height*0.046)
            let v_spacing2 = CGFloat(g.size.height*0.008)
            let result_text = CGFloat(g.size.height*0.03)
            let result_padding = CGFloat(g.size.height*0.01)
            let star_frame = CGFloat(g.size.height*0.063)
            let box_padding = CGFloat(g.size.height*0.02)

        
        ZStack{
            
            Color.gradColor_blue
                .ignoresSafeArea(.all)
            
            VStack(spacing:v_spacing1){
                
                Text("Your Results")
                    .font(Font.custom("Ubuntu-Bold", size: title_text))
                    .foregroundColor(Color("navy"))
                    .padding(title_padding1)
                    .background(
                        RoundedRectangle(cornerRadius: cradius)
                            .fill(Color.gradColor_blue)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
                    .padding(.top, title_padding2)
                
                VStack(alignment:.leading, spacing:v_spacing2){
                    
                    if(personal_best){
                        
                        Text("New Personal Best!")
                            .font(Font.custom("Ubuntu-Bold", size: result_text))
                            .foregroundColor(Color("navy"))
                            .multilineTextAlignment(.leading)
                            .padding([.top, .bottom], result_padding)
                    }
                    
                    // correct, incorrect, stats
                    
                    Text("Correct Answers: " + String(correct))
                        .font(Font.custom("Ubuntu-Medium", size: result_text))
                        .foregroundColor(Color("navy"))
                        .multilineTextAlignment(.leading)
                                        
                    Text("Incorrect Answers: " + String(total-correct))
                        .font(Font.custom("Ubuntu-Medium", size: result_text))
                        .foregroundColor(Color("navy"))
                        .multilineTextAlignment(.leading)
                                        
                    Text("Accuracy: " + String(accuracy) + "%")
                        .font(Font.custom("Ubuntu-Medium", size: result_text))
                        .foregroundColor(Color("navy"))
                        .multilineTextAlignment(.leading)
                                        
                    Text("Time Spent: " + String(time_spent) + " seconds")
                        .font(Font.custom("Ubuntu-Medium", size: result_text))
                        .foregroundColor(Color("navy"))
                        .multilineTextAlignment(.leading)
                    
                    // stats end
                    
                    HStack{
                                        
                        if(stars >= 1.0){
                                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        else if(stars >= 0.5){
                            
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                            
                        }
                                        
                        else{
                                            
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        if(stars >= 2.0){
                                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        else if(stars >= 1.5){
                            
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                            
                        }
                                        
                        else{
                                            
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                        
                        if(stars >= 3.0){
                                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        else if(stars >= 2.5){
                            
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                            
                        }
                                        
                        else{
                                            
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                        
                        if(stars >= 4.0){
                                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        else if(stars >= 3.5){
                            
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                            
                        }
                                        
                        else{
                                            
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                        
                        if(stars >= 5.0){
                                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                        else if(stars >= 4.5){
                            
                            Image(systemName: "star.lefthalf.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                            
                        }
                                        
                        else{
                                            
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: star_frame, height: star_frame)
                                .foregroundColor(Color("navy"))
                                .shadow(color: .white, radius: 5, x: 5, y: 5)
                                            
                        }
                                        
                    } // HStack
                    .padding([.top, .bottom], result_padding)
                                    
                } // VStack
                    .padding(.top, result_padding)
                    .padding(box_padding)
                    .background(
                        RoundedRectangle(cornerRadius: cradius)
                            .fill(Color.gradColor_blue)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
                

                if(!personal_best){
                                   
                    VStack(alignment: .leading, spacing: v_spacing2){
                                       
                        Text("Personal Best")
                            .font(Font.custom("Ubuntu-Bold", size: result_text))
                            .foregroundColor(Color("navy"))
                            .multilineTextAlignment(.leading)
                            .padding([.top, .bottom], result_padding)
                                       
                                       
                        if(stage == 1){
                                           
                            Text("Accuracy: " + String(personal_accuracy_1) + "%")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                            Text("Time Spent: " + String(personal_time_1) + " seconds")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                        }
                        else if(stage == 2){
                                           
                            Text("Accuracy: " + String(personal_accuracy_2) + "%")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                            Text("Time Spent: " + String(personal_time_2) + " seconds")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                        }
                        
                        else if(stage == 3){
                                           
                            Text("Accuracy: " + String(personal_accuracy_3) + "%")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                            Text("Time Spent: " + String(personal_time_3) + " seconds")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                        }
                        
                        else{
                                           
                            Text("Accuracy: " + String(personal_accuracy_4) + "%")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                            Text("Time Spent: " + String(personal_time_4) + " seconds")
                                .font(Font.custom("Ubuntu-Medium", size: result_text))
                                .foregroundColor(Color("navy"))
                                .multilineTextAlignment(.leading)
                                           
                        }
                    } // VStack
                    .padding(box_padding)
                    .background(
                        RoundedRectangle(cornerRadius: cradius)
                            .fill(Color.gradColor_blue)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    )
                                   
                } // if statement
                

                Button(action: {
                    SoundManager.instance.playNext()
                    isPresented = false
                }){
                    HStack{
                        Image(systemName: "arrow.down")
                        Text("back")
                    }
                    
                }
                .buttonStyle(TestResultBackButton(size: back_size, padding: back_padding, crad: cradius))
                

                Spacer()
                
            } // VStack
            
        } // ZStack
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        
        } // geometry

    } // body
} // view

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        TestResultView(isPresented: .constant(true))
//
//        TestResultView(isPresented: .constant(true))
//            .previewDevice("iPad (8th generation)")

    }
}
