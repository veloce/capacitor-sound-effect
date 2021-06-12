export interface SoundEffectPlugin {
  loadSound(options: { id: string, path: string }): Promise<void>
  play(options: { id: string }): Promise<void>
}
