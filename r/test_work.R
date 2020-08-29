# Test R script
supersave <- function(def_root="test_r") {
  save.image(paste(c(def_root,".RData"),collapse=""))
  savehistory(paste(c(def_root,".history"),collapse=""))
}

# Now, let's attempt a 'dir' function
# Syntax: dir("regexp")
dir <- function(def_arg=".*\\.R*") {
  list.files(,def_arg)
}
