//
// Created by Wellington Alves on 03/08/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func load(url: String, completion: (() -> Void)? = nil) {
        kf.setImage(with: URL(string: url),
                options: [.transition(.fade(0.8))],
                completionHandler: { _  in
                    completion?()
                })
    }

    func cancel() {
        kf.cancelDownloadTask()
    }
}

