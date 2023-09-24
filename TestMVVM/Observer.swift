//
//  File.swift
//  TestMVVM
//
//  Created by Дмитрий Пономарев on 30.05.2023.
//

import Foundation

class Observer<T> {
    
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(value: T) {
        self.value = value
    }
    
    func listener(listener: @escaping (T) -> Void) {
        self.listener = listener
        listener(value)
    }
}
