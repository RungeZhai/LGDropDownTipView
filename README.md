# LGDropDownTipView
A drop-down tip view like Weibo

### Demo

<image src="https://cloud.githubusercontent.com/assets/3366713/9149747/59544d96-3dea-11e5-9a00-f98723c20603.gif" width=250>

### Usage

Interface:
```
+ (void)showMessage:(NSString *)message referenceView:(UIView *)view;
```

Say you want to show "Random Message" from navigation bar:
```
[LGDropDownTipView showMessage:@"Random Message" referenceView:self.navigationController.navigationBar];
```
