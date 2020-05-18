# Capacitor Sound Effect

Capacitor plugin to play simple sound effects in your app.

## Installation

```
npm install capacitor-sound-effect
```

## API

| Method                                           | Returns         |
| ------------------------------------------------ | --------------- |
| loadSound(options: { id: string, path: string }) | `Promise<void>` |
| play(options: { id: string })                    | `Promise<void>` |

## Usage

```
import { Plugins } from '@capacitor/core'

Plugins.SoundEffect.loadSound({ id: 'mySound', path: `sounds/mySound.mp3` })

Plugins.SoundEffect.play({ id: 'mySound' })
```
