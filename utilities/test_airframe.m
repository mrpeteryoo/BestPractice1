proj = currentProject;
rootDir = proj.RootFolder;
testFile = strcat("tests", filesep, "f14_airframe_test.m");
runTest(strcat(rootDir, filesep, testFile));