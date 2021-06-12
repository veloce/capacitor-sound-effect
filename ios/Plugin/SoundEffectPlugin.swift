import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(SoundEffectPlugin)
public class SoundEffectPlugin: CAPPlugin {
    

    private let implementation = SoundEffect()

    @objc func loadSound(_ call: CAPPluginCall) {
        guard let path = call.options["path"] as? String else {
            call.reject("Must provide a path")
            return
        }
        
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }

        do {
            try implementation.loadSound(audioId: audioId, path: path)
        } catch {
            call.reject("Could not load file")
            return
        }
    }
    
    @objc func play(_ call: CAPPluginCall) {
        guard let audioId = call.options["id"] as? String else {
            call.reject("Must provide an id")
            return
        }
            
        do {
            try implementation.play(audioId)
        } catch {
            call.reject("Audio not found")
        }
        
        call.resolve()
    }

}
