//
//  PageViewController.swift
//  PageViewController
//
//  Created by Sakkaphong on 2/6/18.
//  Copyright © 2018 Sakkaphong. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    lazy var SubViewController = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetupViewController()
        self.SetupPageViewController()
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    private func SetupViewController() {
        
        guard let OneViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController1") as? OneViewController else { return }
        OneViewController.BackgroundColor = UIColor.red
        SubViewController.append(OneViewController)
        
        guard let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController1") as? OneViewController else { return }
        SecondViewController.BackgroundColor = UIColor.yellow
        SubViewController.append(SecondViewController)
        
        guard let ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? TwoViewController else { return }
        SubViewController.append(ThirdViewController)
        
        guard let first = SubViewController.first else { return }
        //setViewControllers([first], direction: .forward, animated: true, completion: nil)
        setViewControllers([first], direction: .forward, animated: true) { (status) in
            let abc : UIView = UIView()
            abc.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
            abc.backgroundColor = UIColor.white
            self.view.addSubview(abc)
  
        }
    }
    
   
    private func SetupPageViewController() {
        self.view.backgroundColor = UIColor.white
        
        self.dataSource = self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let CurrentIndex : Int = SubViewController.index(of: viewController) ?? 0
        guard CurrentIndex > 0 , let page = SubViewController.get(CurrentIndex - 1) else { return SubViewController.last }
        
        return page
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let CurrentIndex : Int = SubViewController.index(of: viewController) ?? 0
        guard CurrentIndex < SubViewController.count-1 , let page = SubViewController.get(CurrentIndex + 1) else { return SubViewController.first }
        
        return page
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return SubViewController.count
    }
}


