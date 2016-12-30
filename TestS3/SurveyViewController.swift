
import UIKit
import ResearchKit

class SurveyViewController: UIViewController, ORKTaskViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let taskViewController = ORKTaskViewController(task: BodayPartImageTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {

    }
    
    private func taskViewController(taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController){
        stepViewController.skipButtonTitle = "Cancel"
    }
    
    var BodayPartImageTask: ORKOrderedTask {
        var steps = [ORKStep]()
        
        let step =  ORKImageCaptureStep(identifier: "ImageCaptureStep")
        step.title = "Say Cheese"
        steps.append(step)
        return ORKOrderedTask(identifier: "BodayPartImageTask", steps: steps)
    }

}

