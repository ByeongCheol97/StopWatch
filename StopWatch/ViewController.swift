import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var count = 0
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func updateTime() {
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    @IBAction func playbtn(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
    @IBAction func pausebtn(_ sender: Any) {
        myTimer.invalidate()
    }
    @IBAction func stopbtn(_ sender: Any) {
        myTimer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
    }
}
