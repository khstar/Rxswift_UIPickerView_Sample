//
//  ViewController.swift
//  Rxswift_UIPickerView_Sample
//
//  Created by khstar on 13/06/2019.
//  Copyright © 2019 khstar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerTextfield: UITextField!
    @IBOutlet weak var numberBtn: UIButton!
    @IBOutlet weak var stringBtn: UIButton!
    
    let pickerView = UIPickerView()
    //Picker의 데이터 입니다.
    var pickerData:[String] = ["1", "2", "3", "4", "5"]
    
    //PickerView의 ToolBar에 Done버튼 입니다.
    let doneToolBar = UIToolbar()
    let doneBarButton = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                             target: nil,
                                             action: nil)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setRx()
    }
    
    func setRx() {
        
        //DoneButton 눌려지는 경우 Action처리 입니다.
        doneBarButton.rx.tap.subscribe({
            _ in
            
            let i = self.pickerView.selectedRow(inComponent: 0)
            self.pickerTextfield.text = self.pickerData[i]
            self.pickerTextfield.resignFirstResponder()
            
        }).disposed(by: disposeBag)
        
        //여기서 pickerData를 Observable해서 PickerView에 Binding합니다.
        setPickerBind()
        createPicker()
        
    }
    
    @IBAction func changeNumberBtn(_ sender: Any) {
        pickerData = ["1", "2", "3", "4", "5",]
        setPickerBind()
    }
    
    
    @IBAction func changeStringData(_ sender: Any) {
        pickerData = ["가", "나", "다", "라", "마",]
        setPickerBind()
    }
    
    func setPickerBind() {
        
        //pickerView의 delegate와 datasource를 nil 해주지 않으면 아래의 에러가 발생되면서 Crash됨
        //Assertion failed:
        //This is a feature to warn you that there is already a delegate (or data source)
        //set somewhere previously.
        
        pickerView.delegate = nil
        pickerView.dataSource = nil
        
        _ = Observable.just(pickerData).bind(to: pickerView.rx.itemTitles) {
            _, item in
            return "\(item)"
        }
    }
    
    func createPicker() {
        doneToolBar.sizeToFit()
        doneToolBar.items = [doneBarButton]
        
        pickerTextfield.inputAccessoryView = doneToolBar
        pickerTextfield.inputView = pickerView
    }
    
}


