//
//  SignUpRequestModel.swift
//  Car-Book
//
//  Created by Devgan on 13/09/23.
//

import Foundation

struct SignUpRequest {
    var userName: String?
    var email: String?
    var password: String?
    var mobile: String?
    var gender: String?
    var dob: String?
    var country: String?
    var userImage: String?
    var userNameMM: String?
}

/// These are social login request parameters.

struct SocialLoginRequest {
    var logintype: String?
    var name: String?
    var email: String?
    var unique_id: String?
    var img: String?
}


