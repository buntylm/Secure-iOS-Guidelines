//: Playground - noun: a place where people can play

import Foundation

struct APIS {
    static let data = "https://..."
}

/*
 * Certificate/SSL Pinning Example.
 * Written code offline, once verify will post the updated one.
 */

typealias ResponseBlock = (Bool) -> ()

class Web : NSObject, URLSessionDelegate    {
    func request(url: URL, responseHandler: @escaping ResponseBlock )  {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        session.dataTask(with: url) { (data, response, error) in
            responseHandler(true)
            }.resume()
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        //Completing challenge using Username, Password.
        if challenge.protectionSpace.host == "https://gojek.com" {
            if challenge.previousFailureCount < 3   {
                let credentail = URLCredential(user: "username", password: "password", persistence: URLCredential.Persistence.forSession)
                completionHandler(.useCredential, credentail)
            }
        }
        
        //Completing challenge using Client Certificate.
        if let serverTrust = challenge.protectionSpace.serverTrust  {
            if let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                
                // Set SSL policies for domain name check
                SecTrustSetPolicies(serverTrust, SecPolicyCreateSSL(true, (challenge.protectionSpace.host as CFString)))
                
                // Evaluate server certificate
                var result: SecTrustResultType = .unspecified
                SecTrustEvaluate(serverTrust, &result)
                
                // Get local and remote cert data
                let remoteCertificateData = SecCertificateCopyData(certificate)
                if let pathToCert = Bundle.main.path(forResource: "certificate", ofType: "cer") {
                    
                    //here compare the server certificate with client certificate, also verify policies result etc if everything goes fine. Call
                    //completionHandler(.UseCredential, credential)
                    
                    //otherwise cancel the authentication.
                    //completionHandler(.CancelAuthenticationChallenge, nil)
                }
            }
        }
    }
}

let url = URL(string: APIS.data)!
Web.init().request(url: url) { (result) in
    //making request.
}
