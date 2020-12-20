//
//  GameLevel.h
//  tutorial
//
//  Created by p.nosov on 21.12.2020.
//

#import <Foundation/Foundation.h>
@class GameCharacter;

NS_ASSUME_NONNULL_BEGIN

@interface GameLevel : NSObject

- (void)addCharacter:(GameCharacter *)character;
- (NSArray<GameCharacter *> *)allCharacters;

@end

NS_ASSUME_NONNULL_END
