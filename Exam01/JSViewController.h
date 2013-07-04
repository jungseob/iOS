//
//  JSViewController.h
//  Exam01
//
//  Created by jungseob Shin on 2013. 7. 3..
//  Copyright (c) 2013년 jungseob Shin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JSViewController : UIViewController {
    AVAudioPlayer *audioPlayer;
}

- (IBAction)audioControlButtonClick:(id)sender;

@end
