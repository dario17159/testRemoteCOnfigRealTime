import { ChangeDetectorRef, Component, OnDestroy } from '@angular/core';
import { RealTimeRemoteConfig } from 'src/plugins/real-time-remote-config';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnDestroy {

  public label = 'Hello ';

  constructor(private changeDetectorRef: ChangeDetectorRef) {

    RealTimeRemoteConfig.addListener("screenOrientationChange", (res) => {
      console.log('Listener updateKeys with -> ', res.type);
      this.label = res.type;
      this.changeDetectorRef.detectChanges();
    });

    RealTimeRemoteConfig.configureRemoteConfigListener();

  }

  ngOnDestroy(): void {
    RealTimeRemoteConfig.removeAllListeners();
  }



}
