//
//  CounterViewManager.swift
//  SampleMVVM
//
//  Created by 平野裕貴 on 2023/06/11.
//

import Foundation
import UIKit

// CounterViewModelDelegateプロトコルを実装したCounterViewManagerクラスの定義
class CounterViewManager: CounterViewModelDelegate {
    // UILabelの弱参照プロパティcounterLabelを持つ
    weak var counterLabel: UILabel?
    
    // 初期化メソッド。UILabelを引数に取る
    init(counterLabel: UILabel?) {
        self.counterLabel = counterLabel
    }
    // 更新された時に呼び出されるメソッド
    func didUpdateCounter(_ counter: Counter) {
        // カウンターの更新を反映するメソッドを呼び出す
        updateCounter(counter)
    }
    
    // カウンターの値をUIに反映するプライベートメソッド
    private func updateCounter(_ counter: Counter) {
        // メインスレッドでUIを更新する（UIKitのUI操作はメインスレッドで行う必要がある）
        DispatchQueue.main.async {
            self.counterLabel?.text = "\(counter.value)"
        }
    }
}
