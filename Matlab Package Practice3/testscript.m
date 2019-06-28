%Package folders always begin with the + character
%https://www.mathworks.com/help/matlab/matlab_oop/scoping-classes-with-packages.html

%main script
import folderB.codeB1 %just imports codeB1() from the package
import folderC.* %imports all functions from the package
import folderA.* %can import packages within packages from the most exterior package

disp('Starting test')

codeB1()
codeC1()
folderA1.codeA1()
%codeA1() %just this gives an error

disp('ending test')