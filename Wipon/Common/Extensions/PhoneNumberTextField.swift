//
//  PhoneNumberTextField.swift
//  Wipon
//
//  Created by Alexey Pak on 25/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import PhoneNumberKit

extension PhoneNumberTextField {

    fileprivate var nonNumericSet: CharacterSet {
        var mutableSet = NSMutableCharacterSet.decimalDigit().inverted
        mutableSet.remove(charactersIn: "+＋")

        return mutableSet
    }

    var rawPhoneNumber: String? {
        guard let text = text else {
            return nil
        }

        let filteredCharacters = text.filter {
            return  String($0).rangeOfCharacter(from: nonNumericSet) == nil
        }

        return String(filteredCharacters)
    }

}
