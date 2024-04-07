//
//  ReviewHeaderCollectionViewCell.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/7/24.
//

import UIKit
import SnapKit
import Kingfisher

final class ReviewHeaderCollectionViewCell: UICollectionViewCell {
    static let id = "ReviewHeaderCell"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(titleLabel)
        snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        image.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, url: String) {
        if url.isEmpty {
            image.image = UIImage(systemName: "person.fill")
        } else {
            image.kf.setImage(with: URL(string: url))
        }
        
        titleLabel.text = title
    }
}
