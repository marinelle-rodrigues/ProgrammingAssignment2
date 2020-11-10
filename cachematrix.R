## Function takes matrix and returns inverse and caches it

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  matChanged<-TRUE
  #set the matrix first
  setMatrix <- function(x) {
    m <<- x
    inv <<- NULL
    matChanged <<- TRUE
  }
  #get the current matrix
  getMatrix <- function() m
  #set up the inverse matrix
  setMatInverse <- function(inverse) {
    matChanged <<- FALSE
    inv <<- inverse
  }
  
  getMatInverse <- function() inv
  
  isMatChanged <- function() matChanged
  
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,
       setMatInverse = setMatInverse,
       getMatInverse = getMatInverse,
       isMatChanged = isMatChanged)
}

## Write a short comment describing this function

cacheMatrix <- function(mmatrix, ...) {
  inv <- mmatrix$getMatInverse()
  isMChanged <- mmatrix$isMatChanged()
  if(!is.null(inv) && !isMChanged) {
    message("Getting cached inverse of matrix")
    return(inv)
  }
  m <- mmatrix$getMatrix()
  inv <- solve(m)
  mmatrix$setMatInverse(inv)
  
  message("calculating matrix inverse")
  inv
}
        ## Return a matrix that is the inverse of 'x'

