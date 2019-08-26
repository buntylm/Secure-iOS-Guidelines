# Developing Secure iOS Apps 

#### ⭐️ - Star the repo for future updates

### About
Secure coding is the practice of writing programs that are resistant to attack by malicious or mischievous people or programs. Secure coding helps protect a user’s data from theft or corruption.
    
### Swift Developer Meet
Talk at [@GoJek](https://www.meetup.com/SwiftBengaluru/events/241324289/). Posted all slides at [slideshare.net](https://www.slideshare.net/BuntyMadan/ios-security-secureiosguidelines-apple-ios-swift) or you can download from [GIT](https://github.com/buntylm/Secure-iOS-Guidelines/blob/master/iOS-Security.pptx)

### Secure-iOS-Guidelines

  - Avoid cached application
      - Caching of HTTP Request/Response, the default behavior will cache it into cache.db file
      - Drain sensitive data from device memory.
      - Prevent the backup for Keychain data and files with in document directory because if you take back up using iTunes it will sync it.
  - [Detection device compatibility](https://github.com/buntylm/Secure-iOS-Guidelines/tree/master/Jail%20Broken%20Detection) use above mentioned `Objective C` file for verifying.
  ```sh
      - (float) firmwareVersion;
      - (BOOL) isDeviceJailbroken;
      - (BOOL) isAppVersionCracked;
      - (BOOL) isAppStoreVersion;
  ```
  - [Detection Debugger](https://github.com/buntylm/Secure-iOS-Guidelines/tree/master/DetectDebugger) Use above mentioned `Objective C`
  ```sh
      - (bool) AmIBeingDebugged;
  ```
  - User and Application data stored securely. If storing sensitive data on the device is the application requirement, you must add an additional layer for verification, third-party encryption.Whenever encrypting user data, you must encrypt it using a randomly generated master key. iOS implements standard crypto libraries such as AES that can be used to secure data.
      - SQLCipher
      - Keychain
      - Decryption [key generation](https://github.com/buntylm/Secure-iOS-Guidelines/tree/master/Generate%20AES%20Key.playground) – Use iOS AES Crypto library 
  - Proper use of Keychain
      - Remove back up policies.
      - Use of protection classes
  - Prevent insecure ways of deletion the Data
  - Use of Authentication Token if making an HTTP request
  - Always Obscure sensitive value in UI
  - [Certificate Pinning](https://github.com/buntylm/Secure-iOS-Guidelines/tree/master/SLL%20Pinning.playground) must be there, Please review blog for [more about SSL/Certificate Pinning](https://bmnotes.com/2017/07/30/make-your-ios-apps-more-secure-with-ssl-pinning/))
  - Sensitive data in Query string 
  - Disable logs if your using `NSLOG` or `print`
  
  ```
  public class Logger {
        public static func debug(_ message: String? = nil, file: String = #file, function: String = #function, line: Int = #line ) {
        #if DEBUG
        NSLog("\(DEBUG) \(getBody(file: file, function: function, line: line, message: message))")
        #endif
    }
  ```
  
  
  
  - handle Request/Resource timeout properly
  - Insecure Backup, if taking back up of data/files/request make it secure.
  - Implement Anti tempering technique.
  - Detect the [debugger attached or Trace checking](https://github.com/buntylm/Secure-iOS-Guidelines/tree/master/DetectDebugger)
  - Use of UIWebView to prevent framing.
  - Avoid cached application snapshots
        - To protect sensitive data, application must block caching of snapshots using API configuration/Code. When `applicationDidEnterBackground:` returns, the snapshot of the iOS application UI is taken, and used for transition animations, stored in the file system. This method should be overridden, all the sensitive information in the user interface should be removed before it returns.

  
## Contact
[BMNotes.com](https://BMNotes.com) | 
[@buntylm](https://twitter.com/buntylm)
