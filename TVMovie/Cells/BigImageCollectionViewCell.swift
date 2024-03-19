//
//  BigImageCollectionViewCell.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/28.
//

import UIKit
import SnapKit
import Kingfisher

final class BigImageCollectionViewCell: UICollectionViewCell {
    static let id = "BigImageCell"
    
    private let posterImage = UIImageView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(reviewLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        posterImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(500)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(14)
            make.trailing.bottom.equalToSuperview().offset(-14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, overview: String, review: String, url: String) {
        titleLabel.text = title
        reviewLabel.text = review
        descriptionLabel.text = overview
        posterImage.kf.setImage(with: URL(string: url))
    }
}
