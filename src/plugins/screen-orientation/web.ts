import { WebPlugin } from '@capacitor/core';
import type { ScreenOrientationPlugin } from './definitions';

export class ScreenOrientationWeb extends WebPlugin implements ScreenOrientationPlugin{
    constructor() {
        super();
        window.screen.orientation.addEventListener("change", () => {
            const type = window.screen.orientation.type;
            this.notifyListeners("screenOrientationChange", { type });
        });
    }

    orientation(): Promise<{ type: OrientationType; }> {
        throw new Error('Methodo no implementado.');
    }
    lock(opts: { orientation: OrientationLockType; }): Promise<void> {
        throw new Error('Methodo no implementado.');
    }
    unlock(): Promise<void> {
        throw new Error('Methodo no implementado.');
    }
}