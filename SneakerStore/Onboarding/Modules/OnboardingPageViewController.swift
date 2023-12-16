//
//  OnboardingPageViewController.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import UIKit
import SnapKit

final class OnboardingPageViewController: UIViewController {
    //MARK: Private properties
    private let backgroundImageView = UIImageView()
    
    //MARK: Public properties
    var backgroundImage: UIImage?
    
    //MARK: Init
    init(backgroundImage: UIImage?) {
        self.backgroundImage = backgroundImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
