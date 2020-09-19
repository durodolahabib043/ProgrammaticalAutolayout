//
//  MakiRollsViewController.swift
//  Autolayout comps.
//
//  Created by Steven Lipton on 2/17/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class MakiRollsViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Maki Rolls"
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
        imageView.backgroundColor = UIColor(named:menuItem + "Back")
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
       // addImageView()
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
        var constraints = [NSLayoutConstraint]()
        let subView: [UIView] = [ label , orderButton , backButton]
        let stackView = UIStackView.init(arrangedSubviews: subView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
         constraints += [NSLayoutConstraint.init(item: stackView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]

        //MARK: - BACK BTN
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .width, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 0.5, constant: 0.0)]

        //add constraints to view
        view.addConstraints(constraints)
        
    }
    
    
    
}

















