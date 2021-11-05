//
// Created by Wellington Alves on 02/08/21.
//

import UIKit

class VideoCell: UICollectionViewCell {
    var poster: UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.create(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func create(frame: CGRect) {
        poster = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 160))
        poster?.contentMode = .scaleAspectFit
        self.contentView.addSubview(poster!)
    }
}
