//
//  OatmealViewController.swift
//  Autolayout comps.
//
//  Created by Steven Lipton on 2/20/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class OatmealViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Oatmeal"
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        view.directionalLayoutMargins.bottom = 40.0
        view.directionalLayoutMargins.trailing = 10.0
        
        
        var constraints = [NSLayoutConstraint]()
        //MARK: imageView layout
        // imagView.top = safeView.top
        constraints += [NSLayoutConstraint.init(item: imageView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        // imageView.trailing = label.trailing
        constraints += [NSLayoutConstraint.init(item: imageView, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        // imageView.height = safeArea.height * 0.5
        constraints += [NSLayoutConstraint.init(item: imageView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 0.6, constant: 0.0)]
        // imageview.width = imageview.height
        constraints += [NSLayoutConstraint.init(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0.0)]
        
        
        
        //MARK: label layout
        // label.top = safeArea.top
        constraints += [NSLayoutConstraint.init(item: label, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        // label.leading = safeArea.leading
        constraints += [NSLayoutConstraint.init(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        // label.trailing = safeArea.trailing
        constraints += [NSLayoutConstraint.init(item: label, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        // label.height = safeArea.height * 0.10
        constraints += [NSLayoutConstraint.init(item: label, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 0.10, constant: 0.0)]
        
        
            //MARK: orderButton layout
        // orderButton.leading = safeArea.leading
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)]

        //backButton.leading = orderButton.trailing + 20
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .leading, relatedBy: .equal, toItem: orderButton, attribute: .trailing, multiplier: 1.0, constant: 20.0)]

        //     orderButton.bottom = safeArea.bottom + 20
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]


        //MARK: backButton layout
        // backButton.bottom = safeArea.bottom + 20
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        // backButton.trailing = view.trailing + 10
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0)]

        // backButton.height = orderbtn.height * 0.1
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.1, constant: 0.0)]

        //backButton.Width = orderButton.Width *0.5
        constraints += [NSLayoutConstraint (item: backButton, attribute: .width, relatedBy: .equal, toItem: orderButton , attribute: .width, multiplier: 0.6, constant: 0)]
        //backButton.height = orderButton.height
        constraints += [NSLayoutConstraint (item: backButton, attribute: .height, relatedBy: .equal, toItem: orderButton , attribute: .height, multiplier: 1.0, constant: 0)]

        //add constraints to view
        view.addConstraints(constraints)
        
    }
    
    
    
}

















