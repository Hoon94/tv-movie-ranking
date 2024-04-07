//
//  ReviewContentCollectionViewCell.swift
//  TVMovie
//
//  Created by Daehoon Lee on 4/8/24.
//

import UIKit
import SnapKit
import Kingfisher

final class ReviewContentCollectionViewCell: UICollectionViewCell {
    static let id = "ReviewContentCell"
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(content: String) {
        contentLabel.text = content
    }
}
