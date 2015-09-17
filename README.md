# LGDropDownTipView
A drop-down tip view like Weibo & 雪球.

### Demo

<image src="https://cloud.githubusercontent.com/assets/3366713/9149747/59544d96-3dea-11e5-9a00-f98723c20603.gif" width=250 />

### Usage

Interface:
```objective-c
+ (void)showMessage:(NSString *)message referenceView:(UIView *)view;
```

Say you want to show "Random Message" from navigation bar:
```objective-c
[LGDropDownTipView showMessage:@"Random Message" referenceView:self.navigationController.navigationBar];
```

If the message you want to show is the same with the message being shown, the request will be ignored. Otherwise, the showing request will be queued and the message will be shown after the former one disappears. You can show messages to multiple views at the same time.
