//
//  APIError.swift
//  TestableCodeExample
//
//  Created by Ahmed Meguid on 10/2/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class APIError {
    var message: String
    
    init(error: String) {
        self.message = error
    }
}
