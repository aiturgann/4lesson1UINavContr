//
//  SuccessViewController.swift
//  4lesson1UINavContr
//
//  Created by Aiturgan Kurmanbekova on 13/2/24.
//

import UIKit

class SuccessVC: UIViewController {
    
    private let successImage: UIImageView = {
        let successImage = UIImageView()
        successImage.image = .success
        successImage.translatesAutoresizingMaskIntoConstraints = false
        return successImage
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#048494")
        setupUI()

    }
    
    private func setupUI() {
        view.addSubview(successImage)
        NSLayoutConstraint.activate(
            [successImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             successImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             successImage.heightAnchor.constraint(equalToConstant: 235),
             successImage.widthAnchor.constraint(equalToConstant: 183.5)
            ])
        
    }
    
    
}
