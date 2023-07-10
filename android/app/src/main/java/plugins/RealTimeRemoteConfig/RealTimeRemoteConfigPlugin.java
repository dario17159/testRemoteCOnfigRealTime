package plugins.RealTimeRemoteConfig;

import android.util.Log;

import androidx.annotation.NonNull;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.remoteconfig.ConfigUpdate;
import com.google.firebase.remoteconfig.ConfigUpdateListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigValue;

import java.util.Map;
import java.util.Set;

import plugins.ScreenOrientation.ScreenOrientation;

/**
 * @author Dario Carrizo on 01/07/23
 **/
@CapacitorPlugin(name = "RealTimeRemoteConfig")
public class RealTimeRemoteConfigPlugin extends Plugin {

  private RealTimeRemoteConfig implementation;

  @Override
  public void load() {
    implementation = new RealTimeRemoteConfig();
  }

  @PluginMethod()
  public void configureRemoteConfigListener(PluginCall call) {
    implementation.mFirebaseRemoteConfig.addOnConfigUpdateListener(new ConfigUpdateListener() {
      @Override
      public void onUpdate(@NonNull ConfigUpdate configUpdate) {
        Log.d("DARHO-", "Update keys" + configUpdate.getUpdatedKeys());
        implementation.mFirebaseRemoteConfig.activate().addOnCompleteListener(task -> {
          Map<String, FirebaseRemoteConfigValue> allValues =  implementation.mFirebaseRemoteConfig.getAll();
          System.out.println("All values obtained");
        });
        onRemoteConfigChanged(configUpdate.getUpdatedKeys());
      }

      @Override
      public void onError(FirebaseRemoteConfigException error) {
        Log.w("DARHO-", "Config update error with code: " + error.getCode(), error);
      }
    });
    call.resolve();
  }

  private void onRemoteConfigChanged(Set<String> updateKeys) {
    JSObject ret = new JSObject();
    ret.put("type", updateKeys);
    notifyListeners("screenOrientationChange", ret);
  }
}
