//
//  LearnView.swift
//  timestable-final
//
//  Created by Julie Rhee on 2/4/22.
//

import SwiftUI

// variables

public var bool = false
public var answer: Int = -1
public var question = ""
public var level = 2
public var strLevel = "Two"
public var cur_question = 1
public var using = "?"
public var try_again = 0
public var next_question = false
public var maxNum = 10
public var need_review: [Int] = []

// end variables

struct SeeButton: ButtonStyle {
    var crad: CGFloat
    var padding: CGFloat
    var size: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("blackBrown"))
            .multilineTextAlignment(.center)
            .padding(padding)
            .font(Font.custom("Ubuntu-Medium", size: size))
            .background(
                RoundedRectangle(cornerRadius: crad)
                    .fill(Color.gradColor_green)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct BackButton: ButtonStyle {
    var size: CGFloat
    var padding: CGFloat
    var crad: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .foregroundColor(Color("blackBrown"))
            .padding(padding) // 25
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill(Color.gradColor_blue)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct NumberButton: ButtonStyle {
    var size: CGFloat
    var crad: CGFloat
    var frame: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("blackBrown"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 35
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill((configuration.isPressed ? Color.gradColor_powderPink : Color.gradColor_blue))
                    .frame(width: frame, height: frame) // 85
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
    }
}

struct NumberButton2: ButtonStyle {
    var size: CGFloat
    var crad: CGFloat
    var frame: CGFloat
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("blackBrown"))
            .multilineTextAlignment(.center)
            .font(Font.custom("Ubuntu-Medium", size: size)) // 30
            .background(
                RoundedRectangle(cornerRadius: crad) // 30
                    .fill((configuration.isPressed ? Color.gradColor_powderPink : Color.gradColor_blue))
                    .frame(width: frame, height: frame) // 85
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
    }
}

struct LearnView: View {
    
    // app storage declaration
    
    @AppStorage("totalSolved") var total_solved: Int = 0
    
    // app storage declaration end
    
    @State var num1 = level
    
    @State var num2 = cur_question
        
    @State private var string = "?"
    
    @State private var loaded = true
        
    @State private var showLevel = false
    
    @State private var question = String(level) + " × " + String(cur_question) + " = "

    @State private var showResult = false
    
    @State private var end = false
    
    @State private var text_color = Color("blackBrown")
        
    @State private var last = 9
    
    @State private var try_again = 0
    
    @State private var color = Color.gradColor_blue
        
    @State private var accuracy: Double = 0.0
    
    @Binding var isPresented: Bool

    
    init(isPresented: Binding<Bool>){

        self.num1 = level
        self.num2 = cur_question
        self.string = "?"
        self.showResult = false
        self.showLevel = false
        self.loaded = true
        self.accuracy = 0.0
        
        if(level > 9){
            self.last = level
        }
        else{
            self.last = 9
        }
        
        self.end = false
        self.text_color = Color("blackBrown")
        self.color = Color.gradColor_blue
        self.question = String(level) + " × " + String(cur_question) + " = "

        self._isPresented = isPresented

    }
    
    func answered(a: String, b: String){
        loaded = false

        if(a == b){
            // sound
            SoundManager.instance.playCorrect()
            // sound end
            
            color = Color.gradColor_bluePink // change
            question = "CORRECT"
            string = ""
            try_again = 0
            
            if (cur_question == last){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                    loaded = true
                    accuracy = ((Double(need_review.count)/Double(maxNum)).round(nearest: 0.01))
                    self.end = true
                })
            }

            cur_question += 1
        }
        else{
            
            try_again += 1

            if(try_again > 1){
                
                // sound
                SoundManager.instance.playTry()
                // sound end
                
                color = Color.gradColor_blue
                question = String(level) + " × " + String(cur_question) + " = "
                string = String(answer)
                text_color = Color("rose")
                
                if(cur_question < last){
                    try_again = 0
                    cur_question += 1
                }
                
                else{

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                        
                        loaded = true
                        accuracy = ((Double(need_review.count)/Double(maxNum)).round(nearest: 0.01))
                        self.end = true
                        
                    })
                }
                
            } // try again

            else{
                // sound
                SoundManager.instance.playIncorrect()
                // sound end
                
                color = Color.gradColor_pink
                question = "Try"
                string = "Again"
                if(!need_review.contains(cur_question)){
                    need_review.append(cur_question)
                }
            }

        } // else

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                
            color = Color.gradColor_blue
            question = String(level) + " × " + String(cur_question) + " = "
            string = "?"
            text_color = Color("blackBrown")
            loaded = true
        })
    }
    
    func seeAnswer(){
        
        string = String(answer)
        loaded = false
        text_color = Color("lilac")

        // sound
        SoundManager.instance.playSee()
        // sound end
        
        if(!need_review.contains(cur_question)){
            need_review.append(cur_question)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
            string = "?"
            text_color = Color("blackBrown")
            loaded = true
        })
        
    } // see answer
    
    func type(number: Int){
        
        SoundManager.instance.playDefault()
        
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
    } // type
    
    func concatenate(a : Text, b: Text, c: Text, d: Text) -> Text {
        return a + b + c + d
     } // concatenate
    
    var body: some View {
        
        NavigationView {

        GeometryReader { g in
            
            let button_frame = CGFloat(g.size.height*0.105)
            let back_size = CGFloat(g.size.height*0.04)
            let back_padding = CGFloat(g.size.height*0.028)
            let radius = CGFloat(g.size.height*0.035)
            let button_text = CGFloat(g.size.height*0.044)
            let button_stext = CGFloat(g.size.height*0.04)
            let title_text = CGFloat(g.size.height*0.031)
            let title_padding = CGFloat(g.size.height*0.03)
            let v_spacing = CGFloat(g.size.height*0.086)
            let h1_spacing = CGFloat(g.size.height*0.11)
            let h2_spacing = CGFloat(g.size.height*0.095)
            let question_text = CGFloat(g.size.height*0.038)
            let question_padding = CGFloat(g.size.height*0.03)
            let see_text = CGFloat(g.size.height*0.035)
            let see_padding = CGFloat(g.size.height*0.025)
            let fix_spacing = CGFloat(g.size.height*0.034)

        ZStack{
            
            Color.gradColor_green
                .ignoresSafeArea(.all)
            
            VStack{

                Spacer()
                
                HStack{
                    
                    Button(action: {
                        SoundManager.instance.playNext()
                        isPresented = false
                    }){
                        Image(systemName: "arrow.left")
                    }
                    .buttonStyle(BackButton(size: back_size, padding: back_padding, crad: radius))
                    
                    Text(strLevel + " Times Table")
                        .font(Font.custom("Ubuntu-Bold", size: title_text))
                        .foregroundColor(Color("blackBrown"))
                        .padding(title_padding)
                        .background(
                            RoundedRectangle(cornerRadius: radius)
                                .fill(Color.gradColor_green)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        )
                    
                } // HStack
                
                Spacer()
                
                // question
                
                HStack{
                    
                    Text(question)
                        .font(Font.custom("Ubuntu-Bold", size: question_text))
                        .foregroundColor(text_color)
                    
                    Text(string)
                        .font(Font.custom("Ubuntu-Bold", size: question_text))
                        .foregroundColor(text_color)
                    
                }
                .padding(question_padding)
                .background(
                        RoundedRectangle(cornerRadius: radius)
                            .fill(color)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                )
                .padding(.top, fix_spacing*0.2)
                
                Spacer()
                
                // question end
                
                
                VStack(spacing:v_spacing){
                    
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
                            SoundManager.instance.playDefault()
                            if(string != "" && loaded && string != "Again"){
                                string.removeLast()
                                if string.isEmpty { string = "?" }
                            }
                        }){
                            Image(systemName: "delete.left")
                        }
                        .buttonStyle(NumberButton2(size: button_stext, crad: radius, frame: button_frame))
                        
                        NavigationLink(destination: ResultView(isPresented: self.$isPresented), isActive: $end){
                        
                        Button(action: {
                            
                            if(loaded){
                            
                            if(cur_question < last){
                                
                                answer = level * cur_question
                                
//                                correct()
                                
                                answered(a: String(answer), b: string)

                                self.num1 = level
                                self.num2 = cur_question
                                self.showResult = false
                                self.showLevel = false
                                self.end = false
                            }
                            
                            else if (cur_question == last){
                                
                                answer = level * cur_question
                                
                                answered(a: String(answer), b: string)
                                
                            }
                            }
                            
                        }){
                            Text(">")
                        }
                        .buttonStyle(NumberButton(size: button_text, crad: radius, frame: button_frame))
                            
                        } // navigation
                            .isDetailLink(false)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationViewStyle(StackNavigationViewStyle())
                        
                    }// HStack
                
                } // VStack
                .padding(.vertical, fix_spacing) // padding

                Spacer()
                
                // see answer
                
                Button(action: {
                    answer = level * cur_question
                    
                    if (loaded){
                        seeAnswer()
                    }
                }){
                    Text("see answer")
                }
                .buttonStyle(SeeButton(crad: radius, padding: see_padding, size: see_text))
                //see answer end
                Spacer()
                
            }// VStack
            
        } // ZStack

        } // geometry (making dynamic)
        
    } // navigation
    .navigationViewStyle(StackNavigationViewStyle())
    } // body
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(isPresented: .constant(true))
    }
}
