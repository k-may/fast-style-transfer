
SET PYTHONUNBUFFERED=0

@ECHO OFF
: Sets the proper date and time stamp with 24Hr Time for log file naming
: convention

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2%
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

SET CONTENT_WEIGHT=1.5e1
SET STYLE_WEIGHT=5e2
SET TV_WEIGHT=1e2
SET EPOCHS=2

ECHO %EPOCHS%

python style.py --style images/pollock.jpg ^
  --checkpoint-dir checkpoints/ ^
  --model-dir models/pollock/ ^
  --test images/sneeze.jpg ^
  --test-dir tests/ ^
  --content-weight %CONTENT_WEIGHT% ^
  --tv-weight %TV_WEIGHT% ^
  --style-weight %STYLE_WEIGHT% ^
  --checkpoint-iterations 1000 ^
  --log-dir logs/%dtStamp%-CW_%CONTENT_WEIGHT%-SW_%STYLE_WEIGHT%-TVW_%TV_WEIGHT%-EPOCHS-%EPOCHS% ^
  --epochs %EPOCHS% ^
  --batch-size 15

