//
//  ViewController.swift
//  FeelIT
//
//  Created by user on 2023/11/02.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    var isSelected: Bool = false
    
    lazy var textFieldView: UIView = {
        let textFieldView: UIView = UIView()
        textFieldView.backgroundColor = .white
        return textFieldView
    }()
    
    lazy var textFieldPlaceholder: UILabel = {
        let label = UILabel()
        label.text = "텍스트를 입력해주세요."
        label.textColor = UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1)
        return label
    }()
    
    var textField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "텍스트를 입력해주세요."
        textField.isHidden = true
        textField.setPlaceholderColor(UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1))
        return textField
    }()
    
    let footerView: UIView = {
        let view: UIView = UIView()
        return view
    }()
    
    let label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "주의사항\n해당 생성 내용은 AI로 도출된 내용으로, 이가 해당 정보의 객관성을 보장하지 않습니다. 결과를 판단의 근거로 사용하는 것을 권장하지 않습니다."
        label.textColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
        label.numberOfLines = 4
        return label
    }()
    
    let button: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("분석하기", for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var leftButton: UIBarButtonItem = {
        let leftbutton: UIBarButtonItem = UIBarButtonItem(title: "FeelIT",
                        style: .plain,
                        target: self, action: nil)
        leftbutton.tintColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        return leftbutton
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let rightbutton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(menuButtonAction))
        rightbutton.tintColor = UIColor(red: 0/255, green: 196/255, blue: 142/255, alpha: 1)
        return rightbutton
    }()
    
    lazy var backButton: UIBarButtonItem = {
        let backbutton: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonAction))
        backbutton.tintColor = .black
        return backbutton
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
        
        addSubview()
        makeConstraints()
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(tapAction))
        textFieldView.addGestureRecognizer(tapGestureRecognizer)
        
   
        
    }
    
    func addSubview() {
        view.addSubview(textFieldView)
        view.addSubview(footerView)
        textFieldView.addSubview(textFieldPlaceholder)
        footerView.addSubview(label)
        footerView.addSubview(button)
        textFieldView.addSubview(textField)
    }
    
    func makeConstraints() {
        textFieldView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(footerView.snp.top) //
        }
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.height.equalTo(86)
        }
        footerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(label.snp.top).offset(-22) .priority(.high)//
        }
        button.snp.makeConstraints { make in
            make.leading.equalTo(footerView.snp.leading).offset(24)
            make.trailing.equalTo(footerView.snp.trailing).offset(-24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(58)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(footerView.snp.leading).offset(24)
            make.trailing.equalTo(footerView.snp.trailing).offset(-24)
            make.bottom.equalTo(button.snp.top).offset(-22)
        }
        textFieldPlaceholder.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc
    func menuButtonAction() {
        
    }
    
    @objc
    func backButtonAction() {
        guard isSelected else { return }
        self.isSelected = false
        self.label.isHidden = false
        self.textField.text = " "
        UIView.animate(withDuration: 1) {
            self.textFieldView.snp.removeConstraints()
            self.footerView.snp.removeConstraints()
            self.textFieldView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(self.footerView.snp.top)
            }
            self.footerView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(self.label.snp.top).offset(-22)
            }
            
            
            // is selected가 true일 때 navigation bar 변경
            self.navigationItem.title = nil
            self.navigationItem.rightBarButtonItem = self.rightButton
            self.navigationItem.leftBarButtonItem = self.leftButton
            
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.textField.isHidden = true
            self.textFieldPlaceholder.isHidden = false
        }
    }
    
    @objc
    func tapAction() {
        guard !isSelected else { return }
        self.isSelected = true
        self.label.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.textFieldView.snp.removeConstraints()
            self.footerView.snp.removeConstraints()
            self.textFieldView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.height.equalTo(86)
            }
            self.footerView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(self.textFieldView.snp.bottom)
            }
    
            // is selected가 true일 때 navigation bar 변경
            self.navigationItem.title = "텍스트 입력"
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = self.backButton
            
            
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.textField.isHidden = false
            self.textFieldPlaceholder.isHidden = true
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return true
    }
    
}


public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
}
