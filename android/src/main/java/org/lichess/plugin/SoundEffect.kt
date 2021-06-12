package org.lichess.plugin

import android.media.AudioAttributes
import android.media.SoundPool

class SoundEffect {
    private val soundPool = SoundPool.Builder()
            .setMaxStreams(3)
            .setAudioAttributes(
                    AudioAttributes.Builder()
                            .setUsage(AudioAttributes.USAGE_GAME)
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .build()
            ).build()

    private val audioMap = HashMap<String, Int>()

    fun loadSound(audioId: String, path: String) {
      val afd = this.activity.applicationContext.resources.assets.openFd("public/" + path)
      audioMap[audioId] = soundPool.load(afd, 1)
    }

    fun play(audioId: String) {
      val aid = audioMap[audioId]
      if (aid === null) {
        call.error("Audio asset not found")
        return
      }

      soundPool.play(aid, 1f, 1f, 1, 0, 1f)
    }
}
