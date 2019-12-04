import Foundation
import Capacitor
import AVFoundation


@objc(SoundEffect)
public class SoundEffect: CAPPlugin {
    
    var audioMap = [String : AVAudioPlayer]()

    override public func load() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSession.Category.ambient,
                                    mode: AVAudioSession.Mode.default,
                                    options: [])
            try session.setPreferredIOBufferDuration(0.005)
            try session.setActive(true)
        } catch let error as NSError {
            print("Failed to set the audio session: \(error.localizedDescription)")
        }
    }
    
    @objc func loadSound(_ call: CAPPluginCall) {
        
        guard let path = call.options["path"] as? String else {
            call.reject("Must provide a path")
            return
        }
        
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }
        
        let player: AVAudioPlayer
        let basePath = Bundle.main.resourcePath ?? ""
        let fullPath = basePath + "/public/" + path
        let pathUrl = URL(fileURLWithPath: fullPath)

        do {
            player = try AVAudioPlayer(contentsOf: pathUrl)
            player.volume = 0.8
            player.prepareToPlay()
            audioMap[audioId] = player
        } catch {
            call.reject("Could not load file")
            return
        }

        call.resolve()
    }
    
    @objc func play(_ call: CAPPluginCall) {
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }
        
        guard let player = audioMap[audioId] else {
            call.reject("Audio not found")
            return
        }
        
        player.play()
        
        call.resolve()
    }
}
