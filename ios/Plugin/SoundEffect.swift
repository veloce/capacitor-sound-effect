import Foundation
import AVFoundation

enum SoundEffectError: Error {
    case AudioNotFound
}
@objc public class SoundEffect: NSObject {
    var audioMap = [String : AVAudioPlayer]()
    
    override init() {
        super.init()
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

    @objc public func loadSound(audioId: String, path: String) throws {
        let basePath = Bundle.main.resourcePath ?? ""
        let fullPath = basePath + "/public/" + path
        let pathUrl = URL(fileURLWithPath: fullPath)

        let player = try AVAudioPlayer(contentsOf: pathUrl)
        player.volume = 0.8
        player.prepareToPlay()
        audioMap[audioId] = player
    }
    
    @objc public func play(_ audioId: String) throws {
        guard let player = audioMap[audioId] else {
            throw SoundEffectError.AudioNotFound
        }
        
        player.play()
    }
}
