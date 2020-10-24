set BROWSER=chrome
set PROJECT_URL=https://www.westpac.co.nz
set outputdir=C:\Users\Y982410\PycharmProjects\test\testing1
set Testlink_Tag=T
set Jenkins_Build_ID=1
set CODEBUILD_BUILD_ID=test

DEL "C:\Test Automation\Beryllium2\beryllium_regression_test\*.png"
robot      --include   codebuild_ready   *\tests.robot
cmd.exes