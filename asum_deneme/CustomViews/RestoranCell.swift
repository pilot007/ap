import UIKit

class RestoranCell: UITableViewCell {
    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescLabel: UILabel!
    
    func setRestoran(r: RestoranS) {
        videoImageView.image = r.image
        videoTitleLabel.text = r.title
        videoDescLabel.text = r.desc
    }
    
}

