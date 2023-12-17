//
//  OnboardingViewController.swift
//  SneakerStore
//
//  Created by Zhantore on 15.12.2023.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    //MARK: Private properties
    private let pages = [
        OnboardingPageViewController(
            backgroundImage: UIImage(named: "onboarding1")
        ),
        OnboardingPageViewController(
            backgroundImage: UIImage(named: "onboarding2")
        ),
        OnboardingPageViewController(
            backgroundImage: UIImage(named: "onboarding3")
        )
    ]
    
    private let blurImages = [
        UIImage(named: "onboarding1_blur"),
        UIImage(named: "onboarding2_blur"),
        UIImage(named: "onboarding3_blur")
    ]
    
    private var currentPage = 0
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let titleLabel = UILabel.bold(text: "Fast shipping", color: .white, size: 28)
    private let descriptionLabel = UILabel.regular(text: "Get all of your desired sneakers in one place.", size: 17, color: .white)
    private let nextButton = UIButton.cornered(titleText: "Next")
    private let blurImageView = UIImageView()
    //MARK: Public properties
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
        configureBlurImageView()
        
        setConstraints()
    }
    
    //MARK: Helpers
    private func configurePageViewController() {
        let firstPage = pages[currentPage]
        pageViewController.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    private func configureBlurImageView() {
        blurImageView.image = blurImages[currentPage]
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0

        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    private func setConstraints() {
        let backgroundView = UIView()
        self.view.addSubview(backgroundView)
        
        backgroundView.addSubview(blurImageView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(pageControl)
        backgroundView.addSubview(nextButton)
        
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(288)
        }
        
        blurImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
            $0.width.equalTo(200)
            $0.height.equalTo(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(34)
            $0.top.equalToSuperview().inset(80)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(22)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            $0.height.equalTo(54)
        }
    }

    @objc private func nextPage() {
        guard currentPage+1 < 3 else {
            let vc = WelcomeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        currentPage += 1
        let page = pages[currentPage]
        pageControl.currentPage = currentPage
        blurImageView.image = blurImages[currentPage]
        pageViewController.setViewControllers([page], direction: .forward, animated: true, completion: nil)
    }
}
