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
    let disposeBag = DisposeBag()
    var contactManager: ContactManager
    init(contactManager: ContactManager = ContactManager.share) {
        self.contactManager = contactManager
    }

}
