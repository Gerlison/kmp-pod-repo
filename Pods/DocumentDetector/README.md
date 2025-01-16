![Caf](https://github.com/combateafraude/iOS/raw/main/images/caf_icon.png)

# DocumentDetector SDK for iOS

## Current Version

### Stable

| SDK            | Version |
| -------------- |---------|
| DocumentDetector   | 15.0.3  |

#### Requirements

| Deployment Info | Version       |
| --------------- | ------------- |
| iOS Target      | 13.0+         |
| Xcode           | 15.4+         |
| Swift           | 5.10+         |

- A valid [CAF mobileToken](https://docs.caf.io/sdks/access-token).
- Swift Package Manager installed and integrated in your Xcode project.

#### Camera Usage Description

Make sure to add an NSCameraUsageDescription entry to your app's Info.plist file, explaining why your app requires camera access. For example: `"To scan and verify identity documents."`

## Swift Package Manager (SPM) SDK Installation

To add **DocumentDetector 15.0.1** to your project using **Swift Package Manager**:

1. Open your Xcode project.
2. Navigate to **File > Add Packages**.
3. In the search bar, paste the URL of this repository:
```console
https://github.com/combateafraude/DocumentDetector.git
```

4. Select the version `15.0.3` or choose "Up to Next Major" option to ensure that your project will automatically get future compatible updates.

5. Complete the steps, and Xcode will automatically integrate the **DocumentDetector** SDK into your project.

## Usage

To import and use **DocumentDetector** in your app, add the following import statement at the top of your Swift files:

```swift
import DocumentDetector
```

## Privacy Policy and Terms & Conditions of Use

When using our SDKs, please make sure that you agree with our [Privacy Policy](https://en.caf.io/politicas/politicas-de-privacidade) and our [Terms and Conditions of Use](https://en.caf.io/politicas/termos-e-condicoes-de-uso).


