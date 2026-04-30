//
//  ToneGenerator.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import AVFoundation

class ToneGenerator {
    private let engine = AVAudioEngine()
    private let mainMixer: AVAudioMixerNode
    private let outputNode: AVAudioOutputNode
    private var sourceNode: AVAudioSourceNode?
    
    private let frequency: Float = 650.0
    private let sampleRate: Double
    private var time: Float = 0
    
    init() {
        mainMixer = engine.mainMixerNode
        outputNode = engine.outputNode
        sampleRate = outputNode.inputFormat(forBus: 0).sampleRate
        
        setupSourceNode()
        
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try session.setActive(true)
            
            try engine.start()
        } catch {
            print("Error al iniciar el motor: \(error)")
        }
    }
    
    private func setupSourceNode() {
        sourceNode = AVAudioSourceNode { [weak self] (_, _, frameCount, audioBufferList) -> OSStatus in
            guard let self = self else { return noErr }
            
            let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
            for frame in 0..<Int(frameCount) {
                let val = sinf(2.0 * Float.pi * self.frequency * self.time)
                self.time += Float(1.0 / self.sampleRate)
                
                for buffer in ablPointer {
                    let buf: UnsafeMutableBufferPointer<Float> = UnsafeMutableBufferPointer(buffer)
                    buf[frame] = val
                }
            }
            return noErr
        }
        
        guard let sourceNode = sourceNode else { return }
        engine.attach(sourceNode)
        
        let format = outputNode.inputFormat(forBus: 0)
        engine.connect(sourceNode, to: mainMixer, format: format)
        
        mainMixer.outputVolume = 0
    }
    
    func start() {
        mainMixer.outputVolume = 1.0
    }
    
    func stop() {
        mainMixer.outputVolume = 0
    }
}
