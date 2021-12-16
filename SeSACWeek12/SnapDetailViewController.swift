//
//  SnapDetailViewController.swift
//  SeSACWeek12
//
//  Created by 김재경 on 2021/12/14.
//

import UIKit
import SnapKit

class SnapDetailViewController: UIViewController {
    
    let activateButton: MainActivateButton = {
        let button = MainActivateButton()
        button.setTitle("클릭", for: .normal)
        button.addTarget(self, action: #selector(activateButtonPushClicked), for: .touchUpInside)
        return button
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "13,532원"
        return label
    }()
    
    let descriptionLabel = UILabel()
    
    let redView = UIView()
    let blueView = UIView()
     
    /* 버튼 생성 후 SettingViewController NavigationController push*/
    @objc func activateButtonPushClicked() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func activateButtonClicked() {
        
        let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
        vc.name = "고래밥"
//        let vc = DetailViewController()
        present(vc, animated: true, completion: nil)
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
     
    let firstSquareView: SquareBoxView = {
        let view = SquareBoxView()
        view.label.text = "토스뱅크"
        view.imageView.image = UIImage(systemName: "trash.fill")
        return view
    }()
    
    let secondSquareView: SquareBoxView = {
        let view = SquareBoxView()
        view.label.text = "토스증권"
        view.imageView.image = UIImage(systemName: "chart.xyaxis.line")
        return view

    }()

    let thirdSquareView: SquareBoxView = {
        let view = SquareBoxView()
        view.label.text = "고객센터"
        view.imageView.image = UIImage(systemName: "person")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
          
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstSquareView)
        stackView.addArrangedSubview(secondSquareView)
        stackView.addArrangedSubview(thirdSquareView)
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view.snp.width).multipliedBy(1.0/1.0).inset(20)
            $0.height.equalTo(80)
        }
        firstSquareView.alpha = 0
        secondSquareView.alpha = 0
        thirdSquareView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.firstSquareView.alpha = 1
        } completion: { bool in
            
            UIView.animate(withDuration: 1) {
                self.secondSquareView.alpha = 1
            } completion: { bool in
                
                UIView.animate(withDuration: 1) {
                    self.thirdSquareView.alpha = 1
                }
            }
        } 
        
        view.backgroundColor = .white
        [activateButton, moneyLabel, descriptionLabel, redView].forEach {
            view.addSubview($0)
        }

        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(80)
        }
        
        activateButton.snp.makeConstraints {
            $0.leadingMargin.equalTo(view)
            $0.trailingMargin.equalTo(view)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view).multipliedBy(0.1)
        }
        
        redView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(100)
        }
         
        redView.snp.updateConstraints { make in
            make.bottom.equalTo(-500)
        }
        
        redView.addSubview(blueView)
        
        blueView.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(50)
        }
         
    }
     
}
