//
//  OCHamcrest - OCHamcrest.h
//  Copyright 2010 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

/**
	\defgroup integration Unit Test Integration
 */
#import <OCHamcrest/HCMatcherAssert.h>
#import <OCHamcrest/HCNumberAssert.h>

/**
	\defgroup core Core Matchers
 
	Fundamental matchers of objects and values, and composite matchers.
 */
#import <OCHamcrest/HCAllOf.h>
#import <OCHamcrest/HCAnyOf.h>
#import <OCHamcrest/HCDescribedAs.h>
#import <OCHamcrest/HCIs.h>
#import <OCHamcrest/HCIsAnything.h>
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsInstanceOf.h>
#import <OCHamcrest/HCIsNil.h>
#import <OCHamcrest/HCIsNot.h>
#import <OCHamcrest/HCIsSame.h>

/**
	\defgroup library Matcher Library
 
	Library of Matcher implementations
 */

/**
	\defgroup collection Collection Matchers
    
    Matchers of collections.
 
	\ingroup library
 */
#import <OCHamcrest/HCIsCollectionContaining.h>
#import <OCHamcrest/HCIsCollectionOnlyContaining.h>
#import <OCHamcrest/HCIsDictionaryContaining.h>
#import <OCHamcrest/HCIsDictionaryContainingKey.h>
#import <OCHamcrest/HCIsDictionaryContainingValue.h>
#import <OCHamcrest/HCIsIn.h>

/**
	\defgroup number Number Matchers
    
    Matchers that perform numeric comparisons.
 
	\ingroup library
 */
#import <OCHamcrest/HCIsCloseTo.h>
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCOrderingComparison.h>

/**
	\defgroup object Object Matchers
    
    Matchers that inspect objects.
 
	\ingroup library
 */
#import <OCHamcrest/HCHasDescription.h>

/**
	\defgroup text Text Matchers
    
    Matchers that perform text comparisons.
 
	\ingroup library
 */
#import <OCHamcrest/HCIsEqualIgnoringCase.h>
#import <OCHamcrest/HCIsEqualIgnoringWhiteSpace.h>
#import <OCHamcrest/HCStringContains.h>
#import <OCHamcrest/HCStringEndsWith.h>
#import <OCHamcrest/HCStringStartsWith.h>

/**
	\defgroup helpers Helpers
 
	Utilities for writing Matchers
 */
