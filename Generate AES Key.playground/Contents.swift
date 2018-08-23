//: Playground - noun: a place where people can play

import UIKit
/*
 * Generate Key For Encryption.
 */
class LogFile {
    
    private init() {    }
    
    static var detail : String {
        get {
            return info()
        }
    }
    
    static private func info() -> String {
        let a = "\(#line)\(#column)\(#function.characters.count)"
        
        guard let b = Bundle.main.object(forInfoDictionaryKey: "AppIdentifierPrefix") as? String  else  {
            return a
        }
        return "\(b.replacingOccurrences(of: ".", with: ""))\(a)"
    }
}
