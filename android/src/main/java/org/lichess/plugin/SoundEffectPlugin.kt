package org.lichess.plugin

import com.getcapacitor.Plugin
import com.getcapacitor.PluginCall
import com.getcapacitor.PluginMethod
import com.getcapacitor.annotation.CapacitorPlugin

@CapacitorPlugin(name = "SoundEffect")
class SoundEffectPlugin : Plugin() {

  private val implementation = new SoundEffect()

  @PluginMethod
  fun loadSound(call: PluginCall) {
    val audioId = call.getString("id")
    val path = call.getString("path")

    if (audioId === null) {
      call.error("Must supply an id")
      return
    }
    if (path === null) {
      call.error("Must supply a path")
      return
    }

    implementation.loadSound(audioId, path)
    call.resolve()
  }

  @PluginMethod
  fun play(call: PluginCall) {
    val audioId = call.getString("id")

    if (audioId === null) {
      call.error("Must supply an id")
      return
    }

    implementation.play(audioId)
    call.resolve()
  }
}
