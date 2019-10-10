var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { WebPlugin } from '@capacitor/core';
export class SoundEffectWeb extends WebPlugin {
    constructor() {
        super({
            name: 'SoundEffect',
            platforms: ['web']
        });
        this.audioMap = {};
    }
    loadSound({ id, path }) {
        return __awaiter(this, void 0, void 0, function* () {
            const audio = new Audio();
            audio.setAttribute('src', path);
            audio.load();
            this.audioMap[id] = audio;
        });
    }
    play({ id }) {
        return __awaiter(this, void 0, void 0, function* () {
            const audio = this.audioMap[id];
            if (audio)
                audio.play();
        });
    }
}
const SoundEffect = new SoundEffectWeb();
export { SoundEffect };
import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(SoundEffect);
//# sourceMappingURL=web.js.map