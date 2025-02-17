//
//  Sound.swift
//  DavisCraft
//
//  Created by Charlie on 10/18/15.
//  Copyright © 2015 UCDClassNitta. All rights reserved.
//

import Foundation
import AVFoundation

class Sound {
    private static var backgroundMusicPlayer = AVMIDIPlayer()
    
    static func playBackgroundMusic(filename: String) {
        //Load the soundfont
        let soundFontURL = FileManager.returnURLForResource("generalsoundfont.sf2", subdirectory: "snd")
        
        //Load the midi file
        let midiURL = FileManager.returnURLForResource(filename, subdirectory: "snd/music")
        
        do {
            backgroundMusicPlayer = try AVMIDIPlayer(contentsOfURL: midiURL!, soundBankURL:soundFontURL!)
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play({playBackgroundMusic(filename)})
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    static func playEffect(filename: String, subdirectory: String) {
        let sound = AVAudioPlayerPool.returnAVAudioPlayerWithFilenameAndSubdirectoryWithinSnd(filename, subdir: subdirectory)
        sound?.prepareToPlay()
        sound?.play()
    }
}