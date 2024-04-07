//
//  ReviewViewController.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import UIKit

final class ReviewViewController: UIViewController {
    init(id: Int, contentType: ContentType) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
