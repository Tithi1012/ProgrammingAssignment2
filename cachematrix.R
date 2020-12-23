## Put comments here that give an overall description of what your
## functions do

invMat<- function(x= matrix()){
  i<- NULL
  set<- function(z){
    x<<- z
    i<<- NULL
  }
  get<- function() x
  setInv<- function(solveMatrix) inv<<- solveMatrix
  getInv<- function() inv
  list(set= set, get=get, getInv= getInv, setInv= setInv)
}

isCache<- function(x) {
  inv<- x$getInv()
  if (!is.numm(inv)) {
    message("Getting the value from cache!")
    return(inv)
  }
  data<- x$get()
  inv<- solve(data)
  x$setInv(inv)
  inv
}
