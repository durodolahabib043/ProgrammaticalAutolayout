//
//  SpringRollsViewController.swift
//  Autolayout comps.
//
//  Created by Steven Lipton on 2/20/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class SpringRollsViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Spring Rolls"
    var font = UIFont(name: "Avenir", size: 22)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 36.0)
    
    // Subviews
    var imageView = UIImageView()
    var label = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)
    //Actions
    @IBAction func backButton(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Methods
    func addImageView(){
        let image = UIImage(named: menuItem)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        // layout
    }
    
    func addLabel(){
        label.text = menuItem
        label.font = labelFont
        label.textColor = UIColor(named:menuItem + "Label")
        label.backgroundColor = UIColor(named:"WhiteLabelBackground")
        label.textAlignment = .left
        view.addSubview(label)
    }
    
    func addBackButton(){
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = font
        backButton.tintColor = UIColor(named:menuItem + "Background")
        backButton.backgroundColor = UIColor(named:menuItem + "Back")
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    func addOrderButton(){
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.font = font
        orderButton.tintColor = UIColor(named:menuItem + "Background")
        orderButton.backgroundColor = UIColor(named:menuItem + "Button")
        orderButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(orderButton)
    }
    
    func addViews(){
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addImageView()
        addLabel()
        addBackButton()
        addOrderButton()
    }
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        addViews()
        layoutViews()
    }
    
    
    //MARK: - Layout
    
    //Layout your views here
    func layoutViews(){
        imageView.contentMode = .scaleAspectFit
        var constraints = [NSLayoutConstraint]()

        let backBtnView: [UIView] = [ orderButton , backButton]
        let backBtnStackView = UIStackView.init(arrangedSubviews: backBtnView)
        backBtnStackView.axis = .vertical
        backBtnStackView.alignment = .fill
        backBtnStackView.distribution = .fill

        let subView: [UIView] = [ label , imageView]
        let stackView = UIStackView.init(arrangedSubviews: subView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        let horizontalView: [UIView] = [  stackView, backBtnStackView]
        let horizontalViewStackView = UIStackView.init(arrangedSubviews: horizontalView)
        horizontalViewStackView.axis = .horizontal
        horizontalViewStackView.alignment = .fill
        horizontalViewStackView.distribution = .fill

        view.addSubview(horizontalViewStackView)
        horizontalViewStackView.translatesAutoresizingMaskIntoConstraints = false

        constraints += [NSLayoutConstraint.init(item: horizontalViewStackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: horizontalViewStackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: horizontalViewStackView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: horizontalViewStackView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]

        //MARK: - label BTN
        constraints += [NSLayoutConstraint.init(item: label, attribute: .height, relatedBy: .equal, toItem: horizontalViewStackView, attribute: .height, multiplier: 1/9, constant: 0.0)]

        //MARK: - backBtnStackView
        constraints += [NSLayoutConstraint.init(item: backBtnStackView, attribute: .width, relatedBy: .equal, toItem: horizontalViewStackView, attribute: .width, multiplier: 2/9, constant: 0.0)]

        //MARK: - backButton
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .height, relatedBy: .equal, toItem: horizontalViewStackView, attribute: .height, multiplier: 3/9, constant: 0.0)]
        //add constraints to view
        view.addConstraints(constraints)
        
    }
    
    
}

















