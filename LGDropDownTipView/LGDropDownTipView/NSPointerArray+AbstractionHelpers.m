//
//  NSPointerArray+AbstractionHelpers.m
//  LGAlertSheet
//
//  Created by liuge on 8/13/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import "NSPointerArray+AbstractionHelpers.h"

@implementation NSPointerArray (AbstractionHelpers)

- (void)addObject:(id)anObject {
    [self addPointer:(__bridge void *)anObject];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [self insertPointer:(__bridge void *)anObject atIndex:index];
}

- (void)removeLastObject {
    if (self.count == 0) return;
    [self removePointerAtIndex:self.count - 1];
}

- (void)removeObjectAtIndex:(NSUInteger)idx {
    [self removePointerAtIndex:idx];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [self replacePointerAtIndex:index withPointer:(__bridge void *)anObject];
}

- (void)addObjectsFromArray:(NSArray *)otherArray {
    for (id anObject in otherArray) {
        [self addPointer:(__bridge void *)anObject];
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    void *objPtr = [self pointerAtIndex:idx1];
    [self replacePointerAtIndex:idx1 withPointer:[self pointerAtIndex:idx2]];
    [self replacePointerAtIndex:idx2 withPointer:objPtr];
}

- (void)removeAllObjects {
    self.count = 0;
}

- (NSUInteger)indexOfObject:(id)anObject {
    NSUInteger index = NSNotFound;
    
    for (NSUInteger i = 0; i < self.count; ++i) {
        if ([anObject isEqual:[self pointerAtIndex:i]]) {
            index = i;
            break;
        }
    }
    
    return index;
}

- (NSIndexSet *)indexesOfObject:(id)anObject {
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    
    for (NSUInteger i = 0; i < self.count; ++i) {
        if ([anObject isEqual:self[i]]) {
            [indexSet addIndex:i];
        }
    }
    
    return indexSet;
}

- (BOOL)containsObject:(id)anObject {
    return ([self indexOfObject:anObject] != NSNotFound);
}

- (void)removeObject:(id)anObject {
    NSIndexSet *objIndex = [self indexesOfObject:anObject];
    [self removeObjectsAtIndexes:objIndex];
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes {
    [indexes enumerateIndexesWithOptions:NSEnumerationReverse
                              usingBlock:^(NSUInteger idx, BOOL *stop) {
                                  [self removePointerAtIndex:idx];
                              }];
}

- (void)removeAllNulls {
    [self compact];
}

- (id)firstNonNullableObject {
    for (NSUInteger i = 0; i < self.count; ++i) {
        id obj = [self pointerAtIndex:i];
        if (obj) return obj;
    }
    
    return nil;
}

- (id)lastNonNullableObject {
    
    if (self.count == 0) return nil;
    
    NSUInteger i = self.count - 1;
    
    do {
        void *pointer = [self pointerAtIndex:i];
        if (pointer) return (__bridge id)(pointer);
    } while (i-- != 0);
    
    return nil;
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self pointerAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self pointerAtIndex:idx];
}

- (void)setObject:(id)anObject atIndexedSubscript:(NSUInteger)idx {
    [self replacePointerAtIndex:idx withPointer:(__bridge void *)anObject];
}

- (id)firstObject {
    if (self.count == 0) return nil;
    return [self pointerAtIndex:0];;
}

- (id)lastObject {
    if (self.count == 0) return nil;
    return [self pointerAtIndex:self.count - 1];
}

@end
