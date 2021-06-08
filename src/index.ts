import { registerPlugin } from '@capacitor/core';

import type { SoundEffectPlugin } from './definitions';

const SoundEffect = registerPlugin<SoundEffectPlugin>('SoundEffect', {
  web: () => import('./web').then(m => new m.SoundEffectWeb()),
});

export * from './definitions';
export { SoundEffect };
