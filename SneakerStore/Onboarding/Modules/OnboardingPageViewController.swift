//
//  OnboardingPageViewController.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import UIKit

class OnboardingPageViewController: UIViewController {
    //MARK: Private properties
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    //MARK: Public properties
    var titleText: String?
    var descriptionText: String?
    var backgroundImage: UIImage?
    
    //MARK: Init
    init(title: String, description: String, backgroundImage: UIImage) {
        
        titleText = title
        descriptionText = description
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
    }
}
