## New patch version

This is a patch version to update the maintainer:

New maintainer:
  Kent Riemondy <kent.riemondy@cuanschutz.edu>
Old maintainer(s):
  Jay Hesselberth <jay.hesselberth@gmail.com>

## Test environment

* win-builder (devel and  R 4.1.2)
* local OS X install, R 4.1.2
* Windows (on Github Actions), 4.1.2
* macOS (on Github Actions), R 4.1.2
* ubuntu 18.02 (on Github Actions), (devel and R 4.1.2)

## R CMD check results
  
* on win-builder (release and devel)

  Status: OK
  0 errors | 0 warnings | 0 notes
  
* on OS X 

  Status: OK
  0 errors | 0 warnings | 0 notes
  
* on ubuntu

  Status: 1 NOTE
  
  installed size is 18.5Mb
  sub-directories of 1Mb or more:
    libs   17.1Mb

  This package uses Rcpp, which creates a large shared library on linux.
  This note is not present on OS X or windows (appveyor or win-builder).
  
## Reverse dependencies

We checked 1 reverse dependencies (0 from CRAN + 1 from Bioconductor  (`RLSeq`)), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
 
