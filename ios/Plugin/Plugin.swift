import Foundation
import AudioToolbox
import Capacitor


@objc(SoundEffect)
public class SoundEffect: CAPPlugin {
    
    var audioMap = [String : SystemSoundID]()
    
    @objc func loadSound(_ call: CAPPluginCall) {
        
        guard let path = call.options["path"] as? String else {
            call.reject("Must provide a path")
            return
        }
        
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }
        
        var soundID: SystemSoundID = 0
        let basePath = Bundle.main.resourcePath ?? ""
        let fullPath = basePath + "/public/" + path
        let pathUrl = NSURL(fileURLWithPath: fullPath)

        AudioServicesCreateSystemSoundID(pathUrl, &soundID)
        
        audioMap[audioId] = soundID

        call.resolve()
    }
    
    @objc func play(_ call: CAPPluginCall) {
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }
        
        guard let audio = audioMap[audioId] else {
            call.reject("Audio not found")
            return
        }
        
        AudioServicesPlaySystemSound(audio)
        
        call.resolve()
    }
}
