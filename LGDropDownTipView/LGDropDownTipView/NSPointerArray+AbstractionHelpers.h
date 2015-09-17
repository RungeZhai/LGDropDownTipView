//
//  NSPointerArray+AbstractionHelpers.h
//  LGAlertSheet
//
//  Created by liuge on 8/13/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPointerArray (AbstractionHelpers)

/**
 *  Adds pointer to the given object to the array.
 *
 *  @param anObject Object whose pointer needs to be added to the array.
 *  If a pointer to this object already exists in the array, you get a Duplicate.
 *  Call containsObject first if you don't want that to happen.
 */
- (void)addObject:(id)anObject;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)removeLastObject;

- (void)removeObjectAtIndex:(NSUInteger)idx;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

- (void)addObjectsFromArray:(NSArray *)otherArray;

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (void)removeAllObjects;

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;

/**
 *  Retrive lowest index of the given object. 
 *  If none of the objects in the arra is equal to anObject, returns NSNotFound.
 *  @param anObject Object to be located in the array
 */
- (NSUInteger)indexOfObject:(id)anObject;

- (NSIndexSet *)indexesOfObject:(id)anObject;

/**
 *  Checks if pointer to the given object is present in the array.
 *
 *  @param object Object whose pointer's presence needs to be checked.
 *
 *  @return YES if pointer to the given object is already present in the array; NO otherwise.
 */
- (BOOL)containsObject:(id)object;

/**
 *  Removes a pointer that matches the pointer to the passed in object.
 *
 *  @param object An object that's currently in the array. No ill effects if the object is not in the array.
 */
- (void)removeObject:(id)object;



- (void)removeAllNulls;

- (id)firstNonNullableObject;

- (id)lastNonNullableObject;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;

- (id)firstObject;

- (id)lastObject;

@end
