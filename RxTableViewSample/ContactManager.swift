//
//  ContactManager.swift
//  Contact
//
//  Created by Ranjeet on 23/02/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class ContactManager {
    static let share = ContactManager()
    private let disposeBag = DisposeBag()

    private init() {
        getContactList()
    }
    var contacts: Variable<[Contact]> = Variable([Contact]())
    
    fileprivate func getContactList() {
        //featch from server and update contact data
//        Alamofire.request
        guard let url = URL(string: "http://gojek-contacts-app.herokuapp.com/contacts.json") else { return }
        RxAlamofire
            .requestJSON(.get, url)
            .subscribe(onNext: { (response: HTTPURLResponse, json: Any) in
                print("onNext \(response) /njson =\(json)")
                guard let contactsJson = json as? [AnyObject] else { return }
                var contactList = [Contact]()
                for contactJson in contactsJson {
                    if let contact = Contact.serializer(json: contactJson) {
                        contactList.append(contact)
                    }
                }
                contactList.sort(by: { (first: Contact, second: Contact) -> Bool in
                    first.name < second.name
                })
                self.contacts.value = contactList

            }, onError: { (error: Error) in
                print("onError")

        }, onCompleted: {
            print("onCompleted")
        }) {
            print("disposeBag")

//            addDisposableTo(disposeBag)
        }.addDisposableTo(disposeBag)
    }
    
    func profileImage(url: URL?) -> UIImage? {
        return UIImage(named: "icon")
    }
}
