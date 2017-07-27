//
//  MusicManager.swift
//  Fairy Bread
//
//  Created by Tam Huynh on 9/26/16.
//  Copyright © 2016 Lavamy. All rights reserved.
//

import UIKit
import AVFoundation

class MusicManager: NSObject {

    private static var backgroundMusicPlayer = AVAudioPlayer()
    
    public static func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    public static func stopBackgroundMusic() {
        backgroundMusicPlayer.stop()
    }

    
    private static var player = AVAudioPlayer()
    
    public static func playSound(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: newURL)
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

}


