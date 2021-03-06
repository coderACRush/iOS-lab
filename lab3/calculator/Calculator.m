//
//  Calculator.m
//  calculator
//
//  Created by 阮帅 on 18/12/21.
//  Copyright © 2018年 ruansh. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
- (NSMutableString *)disp{
    if(!_disp){
        _disp = [[NSMutableString alloc] init];
    }
    return _disp;
}

- (void) delNumber{
    long len = self.disp.length - 1;
    if(len >= 0){
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
    }
}

- (NSString *)computedResult{
    @try {
        NSExpression *exp1 = [NSExpression expressionWithFormat:self.disp];
        id value = [exp1 expressionValueWithObject:nil context:nil];
        NSLog(@"result = %f", [value floatValue]);
        self.disp = [NSMutableString stringWithString:[value stringValue]];
        return [value stringValue];
    }
    @catch (NSException *exception) {
        self.disp = nil;
        return @"error";
    }@finally{
        
    }
}

-(void)dispConvertToFloat {
    NSArray *arr = [self.disp componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+-*/"]];
    int i= 0;
    for (NSString *e1 in arr)
    {
        float num = [e1 floatValue];
        NSString *numstr=[NSString stringWithFormat:@"%f", num];
        [self.disp replaceCharactersInRange:NSMakeRange(i, e1.length) withString:numstr];
        i += numstr.length + 1;
    }
    
}

- (void)cleardisp{
    self.disp = nil;
}
@end
