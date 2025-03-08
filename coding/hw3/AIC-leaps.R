

install.packages("leaps")  ## For installing the "leaps" package. Comment this line out if the package is already installed in your R library.
library(leaps)     ## Loading the "leaps" package. You will need this for implementing the function below. 


leaps.AIC=function(X,y){
  #
  # X is an n x k matrix and y a vector of n values.
  #
  # This function fits linear models of the sort lm(y~X[,cols]), where
  # cols is a subset of {1,...,k}.  It uses the package leaps to find
  # the best model (according to R^2) among all those for which the
  # number of elements of cols is j, and it does so for j=1,...,k.  It
  # then determines AIC and BIC for each of the k models so determined.
  #
  # In case X and y aren't of the right mode, make them a matrix and
  # a vector, respectively.
  #
  y=as.vector(y)
  X=as.matrix(X)
  num=ncol(X)
  #
  # Create the leaps output, returning only the best model for each
  # number of variables (i.e., nbest=1). 
  #
  out=leaps(X,y,method='r2',nbest=1)
  # 
  # Initialize the aic and bic vectors.
  #
  aic=1:num
  bic=1:num
  #
  # Compute all the AIC and BIC values.
  #
  for(j in 1:num){
    #
    # Determine the variables in the best model containing j independent
    # variables. 
    #
    cols=(1:num)[out$which[j,]==TRUE]
    fit=lm(y~X[,cols])
    #
    # Determine AIC and BIC for the best model with j variables.
    #
    aic[j]=AIC(fit)
    bic[j]=AIC(fit,k=log(length(y)))
  }
  #
  # Print out the output.
  #
  print("AIC values")
  print(aic)
  print("BIC values")
  print(bic)
  #
  # Return the output.
  #
  list(aic,bic)
}

