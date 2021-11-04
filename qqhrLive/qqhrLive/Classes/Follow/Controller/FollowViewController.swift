//
//  FollowViewController.swift
//  qqhrLive
//
//  Created by 金斗石 on 2021/11/1.
//

import UIKit

class FollowViewController: UIViewController {
    
    fileprivate let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height - 100).isActive = true
                stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                // Do any additional setup after loading the view.
                
                let iv1 = UIImageView(image: UIImage(named: "launcher_image_2020_0709"))
                let iv2 = UIImageView(image: UIImage(named: "bblive_2233_loading_error_128x94_"))
                let iv3 = UIImageView(image: UIImage(named: "loading_3_280x158_"))
                
                stackView.addArrangedSubview(iv1)
                stackView.addArrangedSubview(iv2)
                stackView.addArrangedSubview(iv3)
                /*
                iv1.contentMode = .scaleAspectFit
                iv2.contentMode = .scaleAspectFit
                iv3.contentMode = .scaleAspectFit
                 */
                iv1.contentMode = .scaleAspectFill
                iv2.contentMode = .scaleAspectFill
                iv3.contentMode = .scaleAspectFill
                
                iv1.clipsToBounds = true
                iv2.clipsToBounds = true
                iv3.clipsToBounds = true
                
                iv1.layer.cornerRadius = 40
                iv2.layer.cornerRadius = 40
                iv3.layer.cornerRadius = 2
    }
    
}
