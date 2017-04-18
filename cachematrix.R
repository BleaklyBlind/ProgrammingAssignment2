## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
  x <<- y
  inv <<- NULL

}

get <- function()x
setinv <- function(inverse) inv <<- inverse
getinv <- function() inv
list(set = set, get=get, setinv = setinv, getinv = getinv)
}
#First set the matrix then get it.  Then set the inverse and get that.
#Using <<- to set an object to an evironment different from the current environment.
#Used as an input for CacheSolve

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  inv = x$getinv
  
  if (!is.null(inv)){
    
    message("getting cached data")
    return(inv)
  
    }
  mat.data = x$get()
  inv = solve(mat.data, ...)
  
  x$setinv(inv)
  
  return(inv)
}
  
#output of MakeCacheMatrix
#if the input was already calculated then it gets it 
#from the cache and skips the computation
#calculates it if it wasn't skipped
#then sets in the cache in the setinv function
