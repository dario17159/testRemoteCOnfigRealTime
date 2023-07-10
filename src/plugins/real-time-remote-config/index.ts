import { registerPlugin } from '@capacitor/core';

import type { RealTimeRemoteConfigPlugin } from './definitions';

const RealTimeRemoteConfig = registerPlugin<RealTimeRemoteConfigPlugin>(
    'RealTimeRemoteConfig',
    {
        web: () => import('./web').then(m => new m.RealTimeRemoteConfigWeb()),
    },
);

export * from './definitions';
export { RealTimeRemoteConfig };