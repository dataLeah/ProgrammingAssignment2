#create a series of fucntion to£º

#1.set the matrix
#2.get the matrix
#3.set the inverse input matrix 
#4.get the inverse of the input matrix
makeCacheMatrix<-function(x=matrix()){
  mt<-NULL
  set<-function(y){
    x<<-y
    mt<<-NULL
  }
  get<-function()x
  setSolve<-function(m_trans)mt<<-m_trans  #if the m_trans  has already existed
  getSolve<-function()mt
  list(set=set,get=get,
       setSolve=setSolve,getSolve=getSolve)
}
##cache the inverse of the input matrix if the inverse has already existed, otherwise
##calculate the inverse.
cacheSolve<-function(x,...){ #x here is the list of the get inverse functions
  mt<-x$getSolve()
  if(!is.null(mt)){
    message("getting cached solution of tranferring the matrix")
    return(mt)
  }
  m<-x$get()
  mt<-solve(m,...)
  x$setSolve(mt)
  x$getSolve()  ## get the inverse of the "x"
  mt            ## Return a matrix that is the inverse of 'x'
}

