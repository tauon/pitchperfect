//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by tauon on 3/24/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAudio()
        configureUI(.notPlaying)
        snailButton.imageView!.contentMode = .scaleAspectFit
        chipmunkButton.imageView!.contentMode = .scaleAspectFit
        rabbitButton.imageView!.contentMode = .scaleAspectFit
        vaderButton.imageView!.contentMode = .scaleAspectFit
        echoButton.imageView!.contentMode = .scaleAspectFit
        reverbButton.imageView!.contentMode = .scaleAspectFit
    }
}
