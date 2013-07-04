//
//  JSViewController.m
//  Exam01
//
//  Created by jungseob Shin on 2013. 7. 3..
//  Copyright (c) 2013년 jungseob Shin. All rights reserved.
//

#import "JSViewController.h"

enum audioButtonTag {
    BUTTON_PLAY = 100,
    BUTTON_PAUSE,
    BUTTON_STOP,
    BUTTON_RESTART
};

@interface JSViewController ()

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    audioPlayer = nil;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (IBAction)audioControlButtonClick:(id)sender {
    NSNumber *tagNum = [NSNumber numberWithInt:[sender tag]];
    [NSThread detachNewThreadSelector:@selector(playAudio:) toTarget:self withObject:tagNum];
}

- (IBAction)playAudio:(NSNumber *) buttonTag {
    
    if (audioPlayer == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"GetLucky" ofType:@"mp3"];
        
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        [audioPlayer setNumberOfLoops:-1];
        [audioPlayer setVolume:0.3];
        [audioPlayer prepareToPlay];
    }
    
    switch ([buttonTag intValue]) {
        case BUTTON_PLAY:
            [audioPlayer play];
            break;
        case BUTTON_PAUSE:
            [audioPlayer pause];
            break;
        case BUTTON_STOP:
            [audioPlayer stop];
            [audioPlayer setCurrentTime:0.0f];
            break;
        case BUTTON_RESTART:
            [audioPlayer stop];
            [audioPlayer setCurrentTime:0.0f];
            [audioPlayer play];
            break;
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
