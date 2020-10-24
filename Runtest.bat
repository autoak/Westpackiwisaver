set BROWSER=chrome
set PROJECT_URL=https://www.westpac.co.nz
set outputdir= "give your local folder path of your drive where you cloned this repo"
set Testlink_Tag=T
set Jenkins_Build_ID=1
set CODEBUILD_BUILD_ID=test
robot      --include   codebuild_ready   *\tests.robot
cmd.exes
