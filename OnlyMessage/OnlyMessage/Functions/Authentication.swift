//
//  Authentication.swift
//  OnlyMessage
//
//  Created by Ali Amanvermez on 22.02.2023.
//

import Foundation
import FirebaseAuth
class Authentication {
    func createUser(email: String, password: String, _ callback: ((Error?) -> ())? = nil){
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
              if let e = error{
                  callback?(e)
                  return
              }
              callback?(nil)
          }
    }
}
