//
//  Contact.swift
//  Contact
//
//  Created by Ranjeet on 23/02/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import Foundation
import UIKit
/*
 
 {
 "id": 1,
 "first_name": "Amitabh",
 "last_name": "Bachchan",
 "email": "ab@bachchan.com",
 "phone_number": "+919980123412",
 "profile_pic": "https://contacts-app.s3-ap-southeast-1.amazonaws.com/contacts/profile_pics/000/000/007/original/ab.jpg?1464516610",
 "favorite": false,
 "created_at": "2016-05-29T10:10:10.995Z",
 "updated_at": "2016-05-29T10:10:10.995Z"
 }
 
 */
struct Contact {
    private let uniqueId: Int
    private let firstName: String
    private let lastName: String
    private let email: String
    private let phoneNumber: String
    private let profileUrl: String
    private let favorite: Bool
    private let createdAt: String
    private let updatedAt: String
    
    init(uniqueId: Int
        , firstName: String
        , lastName: String
        , profileUrl: String = ""
        , email: String
        , phoneNumber: String
        , createdAt: String = ""
        , updatedAt: String = ""
        , favorite: Bool = false) {
        self.uniqueId = uniqueId
        self.firstName = firstName
        self.lastName = lastName
        self.profileUrl = profileUrl
        self.email = email
        self.phoneNumber = phoneNumber
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.favorite = favorite
    }
    
    var isFavorite: Bool {
        get {
            return self.favorite
        }
    }
    var name: String {
        get {
            return (self.firstName.capitalized + " " + self.lastName.capitalized)
        }
    }
    
    var profileImageUrl: URL? {
        get {
            return URL(string: self.profileUrl)
        }
    }
    
    var updatedAtDate: Date {
        get {
            return Date()
        }
    }
    
    var contactNumber: String {
        get {
            return self.phoneNumber
        }
    }
    
    var emailAddress: String {
        get {
            return self.email
        }
    }
}

extension Contact: Serialize
{
    static func serializer(json: AnyObject) -> Contact? {
        guard let jsonObject = json as? [String: AnyObject] else {
            return nil
        }
        
        guard let uniqueId = jsonObject["id"] as? Int else {
            return nil
        }
        
        let firstName = jsonObject["first_name"] as? String ?? ""
        
        let lastName = jsonObject["last_name"] as? String ?? ""
        
        let email = jsonObject["email"] as? String  ?? ""
        
        let phone = jsonObject["phone_number"] as? String ?? ""
        
        let profilePicUrl = jsonObject["profile_pic"] as? String ?? ""
        
        let favorite = jsonObject["favorite"] as? Bool ?? false
        
        let create = jsonObject["created_at"] as? String ?? ""
        
        let update = jsonObject["updated_at"] as? String ?? ""
        
        return Contact(uniqueId: uniqueId
            , firstName: firstName
            , lastName: lastName
            , profileUrl: profilePicUrl
            , email: email
            , phoneNumber: phone
            , createdAt: create
            , updatedAt: update
            , favorite: favorite)
    }
}

class ContactDataSource {
    let title: String
    let contacts: [Contact]
    init(title: String, contacts: [Contact]) {
        self.title = title
        self.contacts = contacts
    }
}
