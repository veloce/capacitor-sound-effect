export interface SoundEffectPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
