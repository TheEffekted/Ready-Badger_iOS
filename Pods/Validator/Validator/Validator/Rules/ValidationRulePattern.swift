/*

 ValidationRulePattern.swift
 Validator

 Created by @adamwaite.

 Copyright (c) 2015 Adam Waite. All rights reserved.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

*/

import Foundation

public enum ValidationPattern: String {
    case EmailAddress = "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"
    case ContainsNumber = ".*\\d.*"
    case ContainsCapital = "^.*?[A-Z].*?$"
    case ContainsLowercase = "^.*?[a-z].*?$"
    case UKPostcode = "(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKPSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY]))))[ ]?[0-9][A-Z-[CIKMOV]]{2})"
    case USPostcode = "^[0-9]{5}(-[0-9]{4})?$"
}

public struct ValidationRulePattern: ValidationRule {
    
    public typealias InputType = String
    
    public let pattern: String
    public let failureError: ValidationErrorType
    
    public init(pattern: String, failureError: ValidationErrorType) {
        self.pattern = pattern
        self.failureError = failureError
    }
    
    public init(pattern: ValidationPattern, failureError: ValidationErrorType) {
        self.init(pattern: pattern.rawValue, failureError: failureError)
    }
    
    public func validateInput(input: String?) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: input)
    }
    
}
