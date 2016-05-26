//
//  main.m
//  MixedContent
//
//  Created by RYAN ROSELLO on 5/26/16.
//  Copyright © 2016 RYAN ROSELLO. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21,24,13,14,43,41";
        
        NSMutableArray *sepArray = [[line componentsSeparatedByString:@","] mutableCopy];
        
        NSCharacterSet *letterCharacterSet = [NSCharacterSet letterCharacterSet];
        
        NSMutableString *solutionWordsString = [[NSMutableString alloc]init];
        NSMutableString *solutionNumbersString = [[NSMutableString alloc]init];
        
        BOOL hasWords = NO;
        BOOL hasNumbers = NO;
        
        for (NSString *string in sepArray) {
            if ([letterCharacterSet characterIsMember:[string characterAtIndex:0]]) {
                
                [solutionWordsString appendFormat:@"%@,", string];
                hasWords = YES;
            }
            else {
                [solutionNumbersString appendFormat:@"%@,", string];
                hasNumbers = YES;
            }
        }
        
        if (!hasWords || !hasNumbers) {
            NSLog(@"%@", line);
        }
        
        else {
        
            if (solutionWordsString.length > 0) {
                NSRange lastCommaInWordsSolutionRange = NSMakeRange(solutionWordsString.length - 1, 1);
                [solutionWordsString replaceCharactersInRange:lastCommaInWordsSolutionRange withString:@"|"];
            }
        
            if (solutionNumbersString.length > 0) {
                NSRange lastCommaInNumbersSolutionRange = NSMakeRange(solutionNumbersString.length - 1, 1);
                [solutionNumbersString deleteCharactersInRange: lastCommaInNumbersSolutionRange];
            }
        
            NSString *finalSolution = [solutionWordsString stringByAppendingString:solutionNumbersString];
        
            NSLog(@"%@", finalSolution);
        }
    }
    return 0;
}
