//
//  HeaderView.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/28.
//

import UIKit
import SnapKit

final class HeaderView: UICollectionReusableView {
    static let id = "HeaderView"
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String) {
        titleLabel.text = title
    }
}
