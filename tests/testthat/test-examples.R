context("man file example tests")

# From changepoint-package.Rd
# change in variance
set.seed(1)
x=c(rnorm(100,0,1),rnorm(100,0,10))
ansvar=ocpt.var.initialise(x)
test_that('var1',expect_equal(cpts(ansvar),100))

# change in mean
set.seed(1)
y=c(rnorm(100,0,1),rnorm(100,5,1))
ansmean=ocpt.mean.initialise(y)
test_that('mean1',expect_equal(cpts(ansmean),100))

# change in mean and variance
set.seed(1)
z=c(rnorm(100,0,1),rnorm(100,2,10))
ansmeanvar=ocpt.meanvar.initialise(z)
test_that('meanvar1',expect_equal(cpts(ansmeanvar),100))



# From ocpt.mean.Rd
# Example of a change in mean at 100 in simulated normal data
set.seed(1)
x=c(rnorm(100,0,1),rnorm(100,10,1))
ansmean = ocpt.mean.initialise(x,penalty="SIC",class=FALSE)
test_that('mean2',expect_equivalent(cpts(ansmean),100))
ans=ocpt.mean.initialise(x,penalty="Asymptotic",pen.value=0.01) 
test_that('mean3',expect_equal(cpts(ans),100))
ans=ocpt.mean.initialise(x,penalty="Manual",pen.value=100)
test_that('mean4',expect_equivalent(cpts(ans),100))

# From ocpt.meanvar.Rd
# Example of a change in scale parameter (mean and variance) at 100 in simulated gamma data
set.seed(1)
x=c(rgamma(100,shape=1,rate=1),rgamma(100,shape=1,rate=5))
ocpt.meanvar.initialise(x,penalty="SIC",class=FALSE,shape=1)

# Example multiple datasets where the first row has multiple changes in mean and variance and the
#second row has no change in mean or variance
set.seed(1)
x=c(rnorm(50,0,1),rnorm(50,5,3),rnorm(50,10,1),rnorm(50,3,10))
y=rnorm(200,0,1)
z=rbind(x,y)
ans=ocpt.meanvar.initialise(z,penalty="Manual",pen.value=20) 
ansx=ocpt.meanvar.initialise(z,penalty="Manual",pen.value=100)
ansxy=ocpt.meanvar.update(ansx,y)

# From ocpt.range-class.Rd
x=new("ocpt.range")
test_that('class1',expect_is(x,"ocpt.range"))
cpts(x)<-c(10,50,100)
test_that('class2',expect_equivalent(cpts(x),c(10,50,100)))





# From cpt.reg-class.Rd
x=new("ocpt.reg") # creates a new object with the cpt.reg class defaults
test_that('class3',expect_is(x,"ocpt.reg"))
test_that('class4',expect_is(sumstat(x),"matrix"))
sumstat(x)<-matrix(1:10,nrow=5,ncol=2) # replaces the data.set slot from x with a matrix
test_that('class5',expect_equivalent(sumstat(x),matrix(1:10,nrow=5,ncol=2)))




# Example multiple datasets where the first row has multiple changes in variance and the second row
#has no change in variance
set.seed(10)
x=c(rnorm(50,0,1),rnorm(50,0,10),rnorm(50,0,5),rnorm(50,0,1))
y=rnorm(200,0,1)
z=rbind(x,y)
ans=ocpt.var.initialise(z,penalty="Manual",pen.value=20) 
test_that('var1',expect_equivalent(cpts(ans),c(100,199,298)))





# From ocpt-class.Rd
x=new("ocpt") # creates a new object with the cpt class defaults
test_that('class6',expect_is(x,"ocpt"))
test_that('class7',expect_equivalent(cpts(x),numeric()))
cpts(x)<-c(10,50,100) # replaces the cpts slot from x with c(10,50,100)
test_that('class8',expect_equivalent(cpts(x),c(10,50,100)))


# From cpts.full.Rd
x=new("ocpt.range") # new cpt.range object
test_that('class9',expect_is(x,"ocpt.range"))
test_that('class10',expect_is(cpts.full(x),"matrix")) # retrieves the cpts.full slot from x




# From cpts.full-.Rd
x=new("ocpt.range") # new cpt.range object
cpts.full(x)<-matrix(c(10,20,10,NA),nrow=2,byrow=TRUE) 
test_that('class11',expect_equivalent(cpts.full(x),matrix(c(10,20,10,NA),nrow=2,byrow=TRUE) ))




# From cpts.Rd
x=new("ocpt") # new cpt object
test_that('class12',expect_equivalent(cpts(x),numeric())) # retrieves the cpts slot from x


# From cpts-.Rd
x=new("ocpt") # new cpt object
cpts(x)<-10 # replaces the vector of changepoint in object x with 10
test_that('class13',expect_equivalent(cpts(x),10))



# From cpttype.Rd
x=new("ocpt") # new cpt object
test_that('class14',expect_equivalent(cpttype(x),"Not Set")) # retrieves the cpttype slot from x


# From cpttype-.Rd
x=new("ocpt") # new cpt object
cpttype(x)<-"mean" # replaces the existing cpttype in object x with "mean"
test_that('class15',expect_equivalent(cpttype(x),'mean'))


# From data.set-.Rd
x=new("ocpt") # new cpt object
sumstat(x)<-matrix(c(1,2,3,4,5)) # replaces the existing data.set slot in x with c(1,2,3,4,5)
test_that('class16',expect_equivalent(sumstat(x),1:5))




# From distribution.Rd
x=new("ocpt") # new cpt object
test_that('class17',expect_equivalent(distribution(x),character()))



# From distribution-.Rd
x=new("ocpt") # new cpt object
distribution(x)<-"normal" # replaces the current distribution slot of x with "normal"
test_that('class18',expect_equivalent(distribution(x),"normal"))



# From logLik-methods.Rd
set.seed(1)
x=c(rnorm(50,0,1),rnorm(50,0,10),rnorm(50,0,5),rnorm(50,0,1))
out=ocpt.var.initialise(x,penalty="Manual",pen.value=200,Q=5)


# From method.Rd
x=new("ocpt") # new cpt object
test_that('class19',expect_equivalent(method(x),character()))





# From method-.Rd
x=new("ocpt") # new cpt object
method(x)<-"mean" # replaces the existing method slot in x with "mean"
test_that('class20',expect_equivalent(method(x),"mean"))




# From minseglen.Rd
x=new("ocpt") # new cpt object
test_that('class21',expect_equivalent(minseglen(x),numeric()))





# From minseglen-.Rd
x=new("ocpt") # new cpt object
minseglen(x)<-5 # replaces the existing minseglen slot in x with 5
test_that('class22',expect_equivalent(minseglen(x),5))




# From ncpts.max.Rd
x=new("ocpt") # new cpt object
test_that('class23',expect_equivalent(ncpts.max(x),numeric()))





# From ncpts.max-.Rd
x=new("ocpt") # new cpt object
ncpts.max(x)<-10 # replaces the vector of changepoint in object x with 10
test_that('class24',expect_equivalent(ncpts.max(x),10))






# From ncpts.Rd
x=new("ocpt") # new ocpt object
test_that('class25',expect_equivalent(ncpts(x),0)) # returns the number of changepoints (i.e. length of the cpts slot in x minus 1)






# From nseg.Rd
x=new("ocpt") # new cpt object
test_that('class26',expect_equivalent(nseg(x),1))





# From param.est.Rd
x=new("ocpt") # new cpt object
test_that('class27',expect_equivalent(param.est(x),list()))





# From param.est-.Rd
x=new("ocpt") # new cpt object
param.est(x)<-list(mean=0) # replaces the current param.est list in x with list(mean=0)
test_that('class28',expect_equivalent(param.est(x),list(mean=0)))






# From param.Rd
set.seed(1)
x=c(rnorm(100,0,1),rnorm(100,0,10))
ans=ocpt.var.initialise(x,penalty="Manual",pen.value=0.01,param.estimates=FALSE)
ans=param(ans) # fills the param.est slot with the parameter estimes.




# From pen.type.Rd
x=new("ocpt") # new cpt object
test_that('class29',expect_equivalent(pen.type(x),character()))





# From pen.type-.Rd
x=new("ocpt") # new cpt object
pen.type(x)<-"SIC" # replaces the existing pen.type slot in x with "SIC"
test_that('class30',expect_equivalent(pen.type(x),"SIC"))






# From pen.value.full.Rd
x=new("ocpt.range") # new cpt.range object
test_that('class31',expect_equivalent(pen.value.full(x),numeric()))





# From pen.value.full-.Rd
x=new("ocpt.range") # new cpt.range object
pen.value.full(x)<-5 # replaces the existing pen.value.full slot in x with 5
test_that('class32',expect_equivalent(pen.value.full(x),5))





# From pen.value.Rd
x=new("ocpt") # new cpt object
test_that('class33',expect_equivalent(pen.value(x),numeric()))




# From pen.value-.Rd
x=new("ocpt") # new cpt object
pen.value(x)<-5 # replaces the existing pen.value slot in x with 5
test_that('class34',expect_equivalent(pen.value(x),5))





# From seglen.Rd
x=new("ocpt") # new cpt object
test_that('class35',expect_equivalent(seg.len(x),numeric()))





# From test.stat.Rd
x=new("ocpt") # new cpt object
test_that('class36',expect_equivalent(test.stat(x),character()))




# From test.stat-.Rd
x=new("ocpt") # new cpt object

test.stat(x)<-"normal" # replaces the current test.stat slot of x with "normal"
test_that('class37',expect_equivalent(test.stat(x),"normal"))

