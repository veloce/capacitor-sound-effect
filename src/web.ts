import { WebPlugin } from '@capacitor/core';

import type { SoundEffectPlugin } from './definitions';

export class SoundEffectWeb extends WebPlugin implements SoundEffectPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
