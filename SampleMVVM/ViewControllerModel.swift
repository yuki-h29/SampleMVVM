//
//  ViewControllerViewModel.swift
//  SampleMVVM
//
//  Created by 平野裕貴 on 2023/06/11.
//

import Foundation

// CounterViewModelDelegateプロトコルの定義
protocol CounterViewModelDelegate: AnyObject {
    // カウンターが更新された時に呼び出されるメソッド
    func didUpdateCounter(_ counter: Counter)
}

// CounterViewModelクラスの定義
class CounterViewModel {
    // delegateという弱参照プロパティを持つ
    weak var delegate: CounterViewModelDelegate?
    // Counterのインスタンスを生成。値が変わった時にdelegateメソッドを呼び出す
    var counter: Counter = Counter() {
        didSet {
            delegate?.didUpdateCounter(counter)
        }
    }

    // カウンターをインクリメントするメソッド
    func incrementCounter() {
        counter.value += 1
    }

    // カウンターをデクリメントするメソッド
    func decrementCounter() {
        counter.value -= 1
    }
}
