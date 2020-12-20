//
//  GameLevel.m
//  tutorial
//
//  Created by p.nosov on 21.12.2020.
//

#import "GameLevel.h"
#import <tutorial/tutorial-Swift.h>

@interface GameLevel()
@property (nonatomic, strong) NSMutableArray *characters;
@end

@implementation GameLevel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.characters = [NSMutableArray new];
        NSLog(@"LEVEL INITIALIZED");
    }
    return self;
}

- (void)addCharacter:(GameCharacter *)character {
    [self.characters addObject:character];
}

- (NSArray<GameCharacter *> *)allCharacters {
    return self.characters;
}

@end
