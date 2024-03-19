//
//  NormalCollectionViewCell.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/27.
//

import UIKit
import SnapKit
import Kingfisher

class NormalCollectionViewCell: UICollectionViewCell {
    static let id = "NormalCell"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
//        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.addSubview(titleLabel)
        self.addSubview(reviewLabel)
        self.addSubview(descriptionLabel)
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(reviewLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, review: String, description: String, imageURL: String) {
        image.kf.setImage(with: URL(string: imageURL))
        titleLabel.text = title
        reviewLabel.text = review
        descriptionLabel.text = description
    }
}
