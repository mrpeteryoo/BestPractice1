function runTest(file)
% Run the MATLAB unit test and create a summary report.

% Input arguments:
%  file - string - The absolute path to a MATLAB unit test.
%  When you run this function as a custom task, project provides 
%  the file input for each selected file.
%
% Output arguments:
%  report - string - A summary report of the test results. The project
%  displays the result in the Custom Task Results column.

% Copyright 2013-2018 The MathWorks, Inc.

test = matlab.unittest.TestSuite.fromFile(file);
results = test.run();

passed = results([results.Passed]);
printReport('PASSED', passed);

incomplete = results([results.Incomplete]);
printReport('INCOMPLETE', incomplete);

failed = results([results.Failed]);
printReport('FAILED', failed);

disp(['Total time = ' num2str(sum([results.Duration])) 's']);

end

function printReport(status, results)
% Create a report for a set of test results.

if ~isempty(results)
    report = '';
    for n=1:length(results)
        report = [report results(n).Name ' (' num2str(results(n).Duration) 's) ' status '\n'];  %#ok<AGROW>
    end
else
    report = '';
end
disp(sprintf(report))

end
