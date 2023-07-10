import { WebPlugin } from '@capacitor/core';
import type { RealTimeRemoteConfigPlugin } from './definitions';

export class RealTimeRemoteConfigWeb extends WebPlugin implements RealTimeRemoteConfigPlugin {
    constructor() {
        super();
    }

    configureRemoteConfigListener(): Promise<void> {
        throw new Error('Methodo no implementado.');
    }
}