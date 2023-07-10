import type { PluginListenerHandle } from '@capacitor/core';

export interface RealTimeRemoteConfigPlugin {

    configureRemoteConfigListener(): Promise<void>;

    addListener(
        eventName: 'screenOrientationChange',
        listenerFunc: (orientation: { type: string }) => void,
    ): Promise<PluginListenerHandle> & PluginListenerHandle;

    /**
     * Removes all listeners
     */
    removeAllListeners(): Promise<void>;
}