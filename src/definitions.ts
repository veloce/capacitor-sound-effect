declare module "@capacitor/core" {
  interface PluginRegistry {
    SoundEffect: SoundEffectPlugin;
  }
}

export interface SoundEffectPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
