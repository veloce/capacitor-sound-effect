import { WebPlugin } from '@capacitor/core';
import { SoundEffectPlugin } from './definitions';
export declare class SoundEffectWeb extends WebPlugin implements SoundEffectPlugin {
    private audioMap;
    constructor();
    loadSound({ id, path }: {
        id: string;
        path: string;
    }): Promise<void>;
    play({ id }: {
        id: string;
    }): Promise<void>;
}
declare const SoundEffect: SoundEffectWeb;
export { SoundEffect };
