//
//  PastaViewController.swift
//  Autolayout comps.
//
//  Created by Steven Lipton on 2/20/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class PastaViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Pasta"
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
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(named: menuItem + "Button")?.withAlphaComponent(0.25)
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
        navigationController?.isNavigationBarHidden = true
        
        
        //autoresiszing masks
        imageView.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints   = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // changes to views
        imageView.contentMode = .scaleAspectFit
        label.font = label.font.withSize(72)
        orderButton.titleLabel?.font = orderButton.titleLabel?.font.withSize(64)
        backButton.titleLabel?.font = backButton.titleLabel?.font.withSize(48)

        // priorities for views

        var constraints = [NSLayoutConstraint]()

        let subView: [UIView] = [orderButton , backButton]
        let orderBtnStackView = UIStackView.init(arrangedSubviews: subView)
        orderBtnStackView.axis = .horizontal
        orderBtnStackView.alignment = .fill
        orderBtnStackView.distribution = .fill
        orderBtnStackView.spacing = 10

        let fullSubView: [UIView] = [imageView,label, orderBtnStackView]
        let fullStackView = UIStackView.init(arrangedSubviews: fullSubView)
        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.distribution = .fill

        view.addSubview(fullStackView)
        orderBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        fullStackView.translatesAutoresizingMaskIntoConstraints = false

        //leading
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]

        //add constraints
        NSLayoutConstraint.activate(constraints)

    }
    
    
    
}

















