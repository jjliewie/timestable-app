//
//  SoundManager.swift
//  timestable-final
//
//  Created by Julie Rhee on 2/4/22.
//

import SwiftUI
import AVKit

// singleton

class SoundManager {

    static let instance = SoundManager()

    var player: AVAudioPlayer?

    func playCorrect(){

        guard let url = Bundle.main.url(forResource: "correct", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
        
    } // play correct

    func playIncorrect(){

        guard let url = Bundle.main.url(forResource: "incorrect", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
    } // play incorrrect

    func playNext(){

        guard let url = Bundle.main.url(forResource: "next", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
    } // play next
    
    func playSee(){

        guard let url = Bundle.main.url(forResource: "see", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
    } // play see
    
    func playTry(){

        guard let url = Bundle.main.url(forResource: "try", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
    } // play see

    func playDefault(){

        guard let url = Bundle.main.url(forResource: "default", withExtension: ".mp3") else { return }

        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        } catch {}
    } // play default

} // sound manager
