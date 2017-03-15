//
//  ContactListViewModel.swift
//  RxTableViewSample
//
//  Created by Ranjeet on 23/02/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift
import UIKit

class ContactListViewModel {
    private let disposeBag = DisposeBag()
    private var contactManager: ContactManager
    var contacts = Variable<[Contact]>([])
    var dataSource = Variable<[Contact]>([])

    init(contactManager: ContactManager = ContactManager.share) {
        self.contactManager = contactManager
        self.bind()
    }

    func contact(for index: IndexPath) -> Contact? {
        return self.contacts.value[index.row]
    }
    func bind() -> Void {
        contactManager
            .contacts
            .asObservable()
            .bindTo(self.contacts)
        .addDisposableTo(disposeBag)
        
        
        
//        contactManager
//        .contacts
//        .asObservable()
//            .subscribe { (contacts: [Contact]) in
//                contacts
//                .dis
//            contacts.map(<#T##transform: (Contact) throws -> T##(Contact) throws -> T#>)
//        }
    }
}
