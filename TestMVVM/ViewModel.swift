//
//  ViewModel.swift
//  TestMVVM
//
//  Created by Дмитрий Пономарев on 30.05.2023.
//

import Foundation


class ViewModel {
    var observer: Observer<Model> = Observer(value: Model())
    
    func makeNew(count: Int) {
        let baseModel = Model(count: count)
        observer.value = baseModel
    }
}
