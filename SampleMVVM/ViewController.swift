//
//  ViewController.swift
//  SampleMVVM
//
//  Created by 平野裕貴 on 2023/06/11.
//
import UIKit

// UIViewControllerを継承したViewControllerクラスの定義
class ViewController: UIViewController {
    // counterLabelというIBOutletを定義。これはStoryboard上で接続します
    @IBOutlet weak var counterLabel: UILabel!
    
    // CounterViewModelのインスタンスを生成
    var counterViewModel: CounterViewModel = CounterViewModel()
    // CounterViewManagerのインスタンスを生成。初期化はviewDidLoadで行います
    var counterViewManager: CounterViewManager!
    
    // ビューがロードされた時に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        // counterLabelを引数にCounterViewManagerのインスタンスを生成
        counterViewManager = CounterViewManager(counterLabel: counterLabel)
        // CounterViewModelのdelegateにcounterViewManagerをセット
        counterViewModel.delegate = counterViewManager
    }
    
    // incrementボタンが押された時に呼ばれるメソッド
    @IBAction func incrementButtonTapped(_ sender: Any) {
        counterViewModel.incrementCounter()
    }
    
    // decrementボタンが押された時に呼ばれるメソッド
    @IBAction func decrementButtonTapped(_ sender: Any) {
        counterViewModel.decrementCounter()
    }
}
