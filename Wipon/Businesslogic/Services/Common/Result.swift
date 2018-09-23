//
//  Result.swift
//  Wipon
//
//  Created by Alexey Pak on 23/09/2018.
//  Copyright © 2018 alexey.pak. All rights reserved.
//

import Foundation
import ObjectMapper

public enum Result<SuccessValue> {
	case success(SuccessValue)
	case failure(Error)

	/// Returns `true` if the result is a success, `false` otherwise.
	public var isSuccess: Bool {
		switch self {
		case .success:
			return true
		case .failure:
			return false
		}
	}

}
