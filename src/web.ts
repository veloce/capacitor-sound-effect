import { WebPlugin } from '@capacitor/core';
import { SoundEffectPlugin } from './definitions';

export class SoundEffectWeb extends WebPlugin implements SoundEffectPlugin {
  constructor() {
    super({
      name: 'SoundEffect',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const SoundEffect = new SoundEffectWeb();

export { SoundEffect };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(SoundEffect);
