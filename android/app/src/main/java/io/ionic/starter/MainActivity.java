package io.ionic.starter;
import android.os.Bundle;

import androidx.annotation.Nullable;

import com.getcapacitor.BridgeActivity;
import com.getcapacitor.Plugin;

import java.util.ArrayList;
import java.util.List;

import plugins.RealTimeRemoteConfig.RealTimeRemoteConfigPlugin;
import plugins.ScreenOrientation.ScreenOrientationPlugin;

public class MainActivity extends BridgeActivity {
  @Override
  public void onCreate(@Nullable Bundle savedInstanceState) {

    List<Class<? extends Plugin>> plugins = new ArrayList<>();
    plugins.add(ScreenOrientationPlugin.class);
    plugins.add(RealTimeRemoteConfigPlugin.class);

    registerPlugins(plugins);
    super.onCreate(savedInstanceState);
  }
}
