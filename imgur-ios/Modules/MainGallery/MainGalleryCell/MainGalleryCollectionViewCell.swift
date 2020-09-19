import UIKit
import AVKit

class MainGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var bottomView: View!

    var avplayer: AVPlayer?
    let playerController = AVPlayerViewController()
    let imageRepository = SharedLocator.shared.imageRepository
    private var _content: GalleryContent?

    func setup(content: GalleryContent) {
        _content = content

        //avoiding misplaced content by cell reuse
        imageView.image = nil
        playerController.view.removeFromSuperview()

        upsLabel.text = "\(content.ups)"
        viewsLabel.text = "\(content.views)"
        commentLabel.text = "\(content.commentCount)"

        if content.availableMediaIsImage {

            let link = content.availableMediaLink

            guard let url = URL(string: link) else {
                        print("There is no link to load")
                        return
            }

            imageRepository.getImage(for: url, onSuccess: { [weak self] (image, resolvedURL) in
                if url == resolvedURL {

                    print("Content loaded", String(describing: content.type), " ",url)

                    self?.imageView.image = image
                }
            }) { (error) in
                self.imageView.image = nil
                print("Content NOT loaded", String(describing: self._content?.type), " ",url)
            }

            return
        }

        if   let gif = content.images?.first?.mp4,
                    let url = URL.init(string: gif) {

            self.avplayer = AVPlayer(url: url)
            playerController.player = self.avplayer
            playerController.view.frame = self.imageView.frame
            playerController.player?.volume = 0
            playerController.entersFullScreenWhenPlaybackBegins = false
            playerController.player?.play()
            playerController.showsPlaybackControls = false
            playerController.view.backgroundColor = bottomView.backgroundColor
            playerController.player?.externalPlaybackVideoGravity = .resizeAspectFill
            self.contentView.insertSubview(playerController.view, belowSubview: bottomView)

        }

    }



}
