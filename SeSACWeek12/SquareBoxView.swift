//
//  SquareBoxView.swift
//  SeSACWeek12
//
//  Created by 김재경 on 2021/12/13.
//

import UIKit

class SquareBoxView: TapAnimationView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        loadUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        loadUI()
    }
    
    func loadView() {
        let view = Bundle.main.loadNibNamed("SquareBoxView", owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        self.addSubview(view)
    }
    
    func loadUI() {
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.text = "마이페이지"
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .black
    }
}

class TapAnimationView: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        DispatchQueue.main.async {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
                self.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
                self.alpha = 1.0
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
                self.alpha = 1.0
            }
        }
    } 
}
