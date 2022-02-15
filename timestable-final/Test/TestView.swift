//
//  TestView.swift
//  timestableui
//
//  Created by julie rhee on 2021/11/12.
//

import SwiftUI
import Combine

// testing variables

public var stage = 1
public var test_question = 1
public var correct = 0
public var time_spent = "0.0"
public var personal_best = false
public var total = 10
public var double_time = Double(time_spent) ?? 0.0

// testing variables end

struct TestBackButton: ButtonStyle {
    
    var size: CGFloat
    var padding: CGFloat
    var crad: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .foregroundColor(Color("blackBrown"))
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

struct TestView: View {
    
    // appstorage

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
    
    // total solved update
    
    @AppStorage("totalSolved") var total_solved: Int = 0

    //end appstorage declarations
    
    // view variables view
    
    @State var randomInt1 : Int
    
    @State var randomInt2 : Int
    
    @State private var string = "?"
        
    @State private var showLevel = false
        
    @State private var end = false
        
    @State private var last = total
        
    @State private var try_again = 0
    
    @State private var color = Color.gradColor_blue

    @Binding var isPresented: Bool
    
    @State var accuracy : Double = 0.0
    
    @State var loaded = true
    
    
    init(isPresented: Binding<Bool>){
        
        self.string = "?"
        self.showLevel = false
        self.last = total
        self.accuracy = 0.0
        
        self.end = false
        self.color = Color.gradColor_blue
        self._isPresented = isPresented
        
        if(stage == 1){
            self.randomInt1 = Int.random(in: 2..<10)
            self.randomInt2 = Int.random(in: 2..<10)
        }
        
        else if(stage == 2){
            self.randomInt1 = Int.random(in: 9..<13)
            self.randomInt2 = Int.random(in: 2..<13)
            
        }
        
        else if(stage == 3){
            self.randomInt1 = Int.random(in: 12..<20)
            self.randomInt2 = Int.random(in: 2..<20)
            
        }
        
        else{
            self.randomInt1 = Int.random(in: 2..<20)
            self.randomInt2 = Int.random(in: 2..<20)
        }
        
        self.loaded = true
    } // init
    
    func doubleEqual(_ a: Double, _ b: Double) -> Bool {
       return fabs(a - b) < Double.ulpOfOne
    }
    
    // submit function
    
    func submitted(){
        
        loaded = false
        
        // sound
        SoundManager.instance.playNext()
        // sound end
        
        color = Color.gradColor_yellow
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            
            color = Color.gradColor_blue
            
            if(string == String(randomInt1 * randomInt2)){
                correct += 1
                total_solved += 1
            }
            
            test_question += 1
            
            if(stage == 1){
                randomInt1 = Int.random(in: 2..<10)
                randomInt2 = Int.random(in: 2..<10)
            }
            
            else if(stage == 2){
                randomInt1 = Int.random(in: 9..<13)
                randomInt2 = Int.random(in: 2..<13)
                
            }
            
            else if(stage == 3){
                randomInt1 = Int.random(in: 12..<20)
                randomInt2 = Int.random(in: 2..<20)
                
            }
            
            else{
                randomInt1 = Int.random(in: 2..<20)
                randomInt2 = Int.random(in: 2..<20)
                
            }
            
            self.string = "?"
            loaded = true
            
        })
        
        
    }
    
    // submit function end

    func last_submitted(){
        
        // change later
        
        // sound
        SoundManager.instance.playNext()
        // sound end
        
        color = Color.gradColor_yellow
        
        if(string == String(randomInt1 * randomInt2)){
            correct += 1
        }
    }
        
    //new setting_user() function
    
    func setting_user(){
        
        if(stage == 1){
            
            if(accuracy > personal_accuracy_1){
                
                personal_accuracy_1 = accuracy
                personal_time_1 = double_time
                
                personal_best = true

            }
            
            else if(String(accuracy) == String(personal_accuracy_1)){
                
                if(double_time < personal_time_1){
                    
                    personal_accuracy_1 = accuracy
                    personal_time_1 = double_time
                    
                    personal_best = true

                }
            }
            
        } // stage 1
        
        else if (stage == 2){
            
            if(accuracy > personal_accuracy_2){
                
                personal_accuracy_2 = accuracy
                personal_time_2 = double_time
                
                personal_best = true

            }
            
            else if(doubleEqual(accuracy, personal_accuracy_2)){
                if(double_time < personal_time_2){
                    
                    personal_accuracy_2 = accuracy
                    personal_time_2 = double_time
                    
                    personal_best = true

                }
            }
            
        } // stage 2
        
        else if (stage == 3){
            
            if(accuracy > personal_accuracy_3){
                
                personal_accuracy_3 = accuracy
                personal_time_3 = double_time
                
                personal_best = true

            }
            
            else if(doubleEqual(accuracy, personal_accuracy_3)){
                if(double_time < personal_time_3){
                    
                    personal_accuracy_3 = accuracy
                    personal_time_3 = double_time
                    
                    personal_best = true

                }
            }
            
        } // stage 3
        
        else{
            
            if(accuracy > personal_accuracy_4){
                
                personal_accuracy_4 = accuracy
                personal_time_4 = double_time
                
                personal_best = true

            }
            
            else if(doubleEqual(accuracy, personal_accuracy_4)){
                if(double_time < personal_time_4){
                    
                    personal_accuracy_4 = accuracy
                    personal_time_4 = double_time
                    
                    personal_best = true

                }
            }
            
        } // stage 4

    } // setting user function end
    
    func type(number: Int){
        
        // sound
        SoundManager.instance.playDefault()
        // sound end
        
        if(string != "" && loaded && string != "Again"){
            if(string.count == 4){
                string = string
            }
            
            else if (string == "0" || string == "?"){
                string = String(number)
            }
            
            else{
                string += String(number)
            }
        }
        
    }
    
    func concatenate(a : Text, b: Text, c: Text, d: Text) -> Text {
        return a + b + c + d
     }

    @StateObject var timeCounter = TimeCounter()
    
    var body: some View {

        
        NavigationView {
        
        GeometryReader { g in
            
            let button_frame = CGFloat(g.size.height*0.105)
            let radius = CGFloat(g.size.height*0.035)
            let button_text = CGFloat(g.size.height*0.044)
            let button_stext = CGFloat(g.size.height*0.04)
            let title_text1 = CGFloat(g.size.height*0.032)
            let title_text2 = CGFloat(g.size.height*0.035)
            let title_padding = CGFloat(g.size.height*0.06)
            let v_spacing = CGFloat(g.size.height*0.086)
            let h1_spacing = CGFloat(g.size.height*0.11)
            let h2_spacing = CGFloat(g.size.height*0.095)
            let question_text = CGFloat(g.size.height*0.038)
            let question_padding = CGFloat(g.size.height*0.03)
            let back_text = CGFloat(g.size.height*0.035)
            let back_padding = CGFloat(g.size.height*0.025)
            let fix_spacing = CGFloat(g.size.height*0.032)

        ZStack{
            
            Color.gradColor_green
                .ignoresSafeArea(.all)
            
            VStack{

                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Time Elapsed:")
                            .font(Font.custom("Ubuntu-Medium", size: title_text1)) // 25
                            .foregroundColor(Color("blackBrown"))
                            
                        HStack{
                            Text(String(format: "%.1f", timeCounter.time))
                                .font(Font.custom("Ubuntu-Bold", size: title_text2)) // 30
                                .foregroundColor(Color("blackBrown"))
                                        
                            Text("seconds")
                                .font(Font.custom("Ubuntu-Medium", size: title_text1)) // 25
                                .foregroundColor(Color("blackBrown"))
                                        
                        } // HStack

                    } // VStack
                    .padding(.leading, title_padding) // 55
                    
                    Spacer()
                } // HStack
                
                Spacer()
                
                // question
                
                HStack{
                    
                    concatenate(a: Text(String(randomInt1)), b: Text(" × "), c: Text(String(randomInt2)), d: Text(" = "))
                        .font(Font.custom("Ubuntu-Bold", size: question_text))
                        .foregroundColor(Color("blackBrown"))
                    
                    Text(string)
                        .font(Font.custom("Ubuntu-Bold", size: question_text))
                        .foregroundColor(Color("blackBrown"))
                    
                }
                .padding(question_padding)
                .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(color)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )

                Spacer()
                
                // question end
                
                VStack(spacing: v_spacing){
                    
                    HStack(spacing:h1_spacing){
                        
                        Button(action: {
                            type(number: 1)
                        }){
                            Text("1")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                        Button(action: {
                            type(number: 2)
                        }){
                            Text("2")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                        Button(action: {
                            type(number: 3)
                        }){
                            Text("3")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                    }// HStack
                    
                    HStack(spacing:h1_spacing){
                        
                        Button(action: {
                            type(number: 4)
                        }){
                            Text("4")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        Button(action: {
                            type(number: 5)
                        }){
                            Text("5")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                        Button(action: {
                            type(number: 6)
                        }){
                            Text("6")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                    }// HStack
                    
                    HStack(spacing:h1_spacing){
                        
                        Button(action: {
                            type(number: 7)
                        }){
                            Text("7")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                    
                        Button(action: {
                            type(number: 8)
                        }){
                            Text("8")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                        Button(action: {
                            
                            type(number: 9)
                            
                        }){
                            Text("9")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                        
                    }// HStack
                    
                    HStack(spacing:h2_spacing){
                        
                        Button(action: {
                            type(number: 0)
                        }){
                            Text("0")
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))


                            
                        Button(action: {
                            
                            // sound
                            SoundManager.instance.playDefault()
                            // sound end
                            
                            if(string != "" && loaded && string != "Again"){
                                string.removeLast()
                                if string.isEmpty { string = "?" }
                            }
                        }){
                            Image(systemName: "delete.left")
                        }
                        .buttonStyle(NumberButton2(size: button_stext, crad: radius, frame: button_frame))
                        
                        NavigationLink(destination: TestResultView(isPresented: self.$isPresented), isActive: $end){
                        
                        Button(action: {
                            
                            if(loaded){
                            
                                if(test_question < last){
                                    
                                    submitted()
                                }
                                
                                else if (test_question == last){

                                    last_submitted()
                                    
                                    timeCounter.pause()
                                    
                                    time_spent = String(format: "%.1f", timeCounter.time)
                                    
                                    double_time = Double(time_spent) ?? 0.0
                                    
                                    accuracy = ((Double(correct)/Double(total)).round(nearest: 0.01))*100.0
                                    
                                    setting_user()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                                        self.end = true
                                    })
                                    
                                }
                                
                            } //loaded
                            
                        }){
                            Text(">")
//                              .fixedSize()
                        }
                         .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))

                            
                        } // navigation
                            .isDetailLink(false)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationViewStyle(StackNavigationViewStyle())
                        
                    }// HStack
                
                } // VStack
                .padding(.vertical, fix_spacing)

                Spacer()
                
                Button(action: {
                    SoundManager.instance.playNext()
                    isPresented = false
                }){
                    HStack{
                        Image(systemName: "arrow.down")
                        Text("back")
                    }
                }
                .buttonStyle(TestBackButton(size: back_text, padding: back_padding, crad: radius))
                
                Spacer()
                
            }// VStack
            
        } // ZStack

        
    } // navigation
    
    } // geometry
        .navigationViewStyle(StackNavigationViewStyle())
        
    } // body

} // view

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
//        TestView(isPresented: .constant(true))
//            .previewDevice("iPad (8th generation)")
        TestView(isPresented: .constant(true))
    }
}
