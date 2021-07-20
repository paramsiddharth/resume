@echo off

setlocal enabledelayedexpansion

::Install all production modules
echo Installing all production modules...
call npm ci --only=production

::Create .nojekyll
echo Ensuring .nojekyll...
if not exist .nojekyll (
	copy nul .nojekyll >nul || goto :error
)

::Delete .gitignore
echo Deleting .gitignore...
if exist .gitignore (
	del /f /q /s .gitignore >nul || goto :error
)

::Commit and push
echo Staging files...
git add .                                        || goto :error
echo Committing...
git commit --allow-empty-message --no-edit       || goto :error
echo Pushing...
git push -f origin main:gh-pages                    || goto :error

::Reset one commit back
echo Resetting to previous commit...
git reset --hard HEAD~                           || goto :error

::Resetting dependencies
echo Resetting dependencies...
call npm ci                                           || goto :error

endlocal

exit /b

:error
exit /b %errorlevel%

:eof
exit /b