## The objective of this assigment is to create a function that cache the inverse of a matrix

## makeCacheMatrix the following useful subfuntions to handle the matrix:
##
## - setMatrix - sets the original matrix
## - getMatrix - gets the original matrix
## - setInverseMatrix - sets the inversed matrix
## - getInverseMatrix - gets the inversed matrix
##

makeCacheMatrix <- function(x = matrix()) {

## We need to initialize the property
  InverseCacheMatrix <- NULL
  
## setMatrix function
  setMatrix <- function(matrix){
    x <<- matrix
    InverseCacheMatrix <<- NULL
  }

## getMatrix function
  getMatrix <- function() x
  
## setInverseMatrix
  setInverseMatrix <- function(InverseMatrix) InverseCacheMatrix <<- InverseMatrix
  
## getInverseMatrix
  getInverseMatrix <- function() InverseCacheMatrix
  
## List of methods  
  list( setMatrix = setMatrix, getMatrix = getMatrix, setInverseMatrix = setInverseMatrix , getInverseMatrix = getInverseMatrix )
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverses already been calculated, then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        
## Assigning existing value if it exists  
  InverseCacheMatrix <- x$getInverseMatrix()
  
## Checking if the inverse matrix exists in cache
  if (!is.null(InverseCacheMatrix)) {
    message("Getting cached data")
    return(InverseCacheMatrix)
  }
  
## Otherwise let's inverse it
  y <- x$getMatrix()
  InverseMatrix <- solve(y) ## We assume that the matrix supplied is always invertible
  x$setInverseMatrix(InverseMatrix)
  InverseMatrix
}
