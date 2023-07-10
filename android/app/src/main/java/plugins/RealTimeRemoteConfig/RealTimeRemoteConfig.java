package plugins.RealTimeRemoteConfig;

import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.remoteconfig.ConfigUpdate;
import com.google.firebase.remoteconfig.ConfigUpdateListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfig;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;

import io.ionic.starter.R;

/**
 * @author Dario Carrizo on 01/07/23
 **/
class RealTimeRemoteConfig {
  FirebaseRemoteConfig mFirebaseRemoteConfig;

  RealTimeRemoteConfig() {
    this.mFirebaseRemoteConfig = FirebaseRemoteConfig.getInstance();

    FirebaseRemoteConfigSettings configSettings = new FirebaseRemoteConfigSettings.Builder()
      .setMinimumFetchIntervalInSeconds(3600)
      .build();
    mFirebaseRemoteConfig.setConfigSettingsAsync(configSettings);

    mFirebaseRemoteConfig.setDefaultsAsync(R.xml.remote_config_defaults);
  }

}
