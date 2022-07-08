//
//  SignUpViewController.swift
//  Movie
//
//  Created by 이동기 on 2022/07/06.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailAddressNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var recommendationCode: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var addInfo: UIButton!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    @IBOutlet weak var settingInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black

        titleLabelSetting("JACKFLIX", .red, .boldSystemFont(ofSize: 35), .center)
        emailOrNumber()
        passwordTextSet(placeholder: "비밀번호", tAlignment: .center, isSecure: true)
        nicknameTextSet(placeholder: "닉네임", tColor: .white, bgColor: .darkGray, style: .roundedRect)
        addressTextSet(placeholder: "위치", alignment: .center, tColor: .white, bgColor: .darkGray)
        recommendationCodeTextSet(borderStyle: .roundedRect, keyType: .numberPad, returnKeyType: .done)
        signUpBtnSet(bgColor: .white, font: .boldSystemFont(ofSize: 20))
        addInfoSet(bgColor: .black, font: .systemFont(ofSize: 15))
        switchBtnSet(tintColor: .red, thumbColor: .cyan, bgColor: .lightGray)
        settingInfoSet(bgColor: .darkGray, tColor: .white, fontSize: .systemFont(ofSize: 15))
    }
    
    func titleLabelSetting(_ title: String, _ tColor: UIColor,_ fontSize: UIFont , _ align: NSTextAlignment) {
        titleLabel.text = title
        titleLabel.textColor = tColor
        titleLabel.font = fontSize
        titleLabel.textAlignment = align
    }
    func emailOrNumber() {
        emailAddressNumber.placeholder = "이메일 주소 또는 전화번호"
        emailAddressNumber.textAlignment = NSTextAlignment.center
        emailAddressNumber.textColor = UIColor.white
        emailAddressNumber.backgroundColor = UIColor.darkGray
        emailAddressNumber.borderStyle = UITextField.BorderStyle.roundedRect
        emailAddressNumber.keyboardType = UIKeyboardType.emailAddress
        emailAddressNumber.returnKeyType = UIReturnKeyType.done
    }
    func passwordTextSet(placeholder: String, tAlignment: NSTextAlignment, isSecure: Bool) {
        password.placeholder = placeholder
        password.textAlignment = tAlignment
        password.backgroundColor = UIColor.darkGray
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.isSecureTextEntry = isSecure
        password.returnKeyType = UIReturnKeyType.done
    }
    func nicknameTextSet(placeholder: String, tColor: UIColor, bgColor: UIColor, style borderStyle: UITextField.BorderStyle) {
        nickname.placeholder = "닉네임"
        nickname.textAlignment = NSTextAlignment.center
        nickname.textColor = UIColor.white
        nickname.backgroundColor = UIColor.darkGray
        nickname.borderStyle = UITextField.BorderStyle.roundedRect
        nickname.returnKeyType = UIReturnKeyType.done
    }
    func addressTextSet(placeholder: String, alignment: NSTextAlignment, tColor: UIColor, bgColor: UIColor) {
        address.placeholder = placeholder
        address.textAlignment = alignment
        address.textColor = tColor
        address.backgroundColor = bgColor
        address.borderStyle = UITextField.BorderStyle.roundedRect
        address.returnKeyType = UIReturnKeyType.done
    }
    func recommendationCodeTextSet(borderStyle: UITextField.BorderStyle, keyType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        recommendationCode.placeholder = "추천 코드 입력"
        recommendationCode.textAlignment = NSTextAlignment.center
        recommendationCode.textColor = UIColor.white
        recommendationCode.backgroundColor = UIColor.darkGray
        recommendationCode.borderStyle = borderStyle
        recommendationCode.keyboardType = keyType
        recommendationCode.returnKeyType = returnKeyType
    }
    
    func signUpBtnSet(bgColor: UIColor, font: UIFont) {
        signUpButton.backgroundColor = bgColor
        signUpButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        signUpButton.setTitle("회원가입", for: UIControl.State.normal)
        signUpButton.titleLabel?.font = font
    }
    func addInfoSet(bgColor: UIColor, font: UIFont) {
        addInfo.setTitle("추가 정보 입력", for: .normal)
        addInfo.setTitleColor(UIColor.white, for: UIControl.State.normal)
        addInfo.backgroundColor = bgColor
        addInfo.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        addInfo.titleLabel?.font = font
    }
    func switchBtnSet(tintColor: UIColor, thumbColor: UIColor, bgColor: UIColor ) {
        switchBtn.onTintColor = UIColor.red
        switchBtn.thumbTintColor = UIColor.cyan
        switchBtn.backgroundColor = UIColor.lightGray
        switchBtn.layer.cornerRadius = 16
    }
    func settingInfoSet(bgColor: UIColor, tColor: UIColor, fontSize: UIFont) {
        settingInfo.backgroundColor = bgColor
        settingInfo.textColor = tColor
        settingInfo.font = fontSize
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tapSignUpBtn(_ sender: Any) {
        if emailAddressNumber.text == "" || password.text == "" {
            settingInfo.text = "이메일 혹은 패스워드는 반드시 입력해야 합니다."
        } else if emailAddressNumber.text?.contains("@") == false {
            settingInfo.text = "이메일 주소엔 반드시 @가 포함되어야 합니다."
            emailAddressNumber.text = ""
        } else if password.text!.count < 6 {
            settingInfo.text = "비밀번호는 6자리 이상이어야합니다."
            password.text = ""
        } else if Int(recommendationCode.text!) == nil {
            settingInfo.text = "추천인 코드는 숫자만 입력이 가능합니다."
            recommendationCode.text = ""
        } else {
            settingInfo.text = "회원가입이 완료되었습니다."
        }
        
        view.endEditing(true)
    }
    
}
