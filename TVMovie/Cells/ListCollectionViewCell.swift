//
//  ListCollectionViewCell.swift
//  TVMovie
//
//  Created by Daehoon Lee on 2024/02/28.
//

import UIKit
import SnapKit
import Kingfisher

final class ListCollectionViewCell: UICollectionViewCell {
    static let id = "ListCell"
    
    private let posterImage = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
        
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private let releaseDateLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        
        posterImage.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(posterImage.snp.trailing).offset(8)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel.snp.leading)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, releaseDate: String, url: String) {
        titleLabel.text = title
        releaseDateLabel.text = releaseDate
        posterImage.kf.setImage(with: URL(string: url))
    }
}
