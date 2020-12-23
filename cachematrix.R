## Put comments here that give an overall description of what your
## functions do

#this function is for calculating the inverse of the matrix
invMat<- function(x= matrix()){
  i<- NULL
  #here we set the variables but outside the scope of the function
  set<- function(z){
    x<<- z
    i<<- NULL
  }
  get<- function() x
  setInv<- function(solveMatrix) inv<<- solveMatrix
  #setting the inverse to inv
  getInv<- function() inv
  #getting the inverse stored in inv
  list(set= set, get=get, getInv= getInv, setInv= setInv)
}
#now we check if the value is in the cache already
isCache<- function(x, ...) {
  inv<- x$getInv()
  #we get the inverse from getInv function by passing x
  if (!is.null(inv)) {
    #this means that the inverse is already present in the cache
    message("Getting the value from cache!")
    return(inv)
  }
  #if inverse is not already present in cache
  #we need to calculate it using our function
  #we get the x and store it in data
  data<- x$get()
  #then we solve for the inverse
  inv<- solve(data)
  #and finally store the inverse in the cache through the setInv function
  x$setInv(inv)
  inv
}
