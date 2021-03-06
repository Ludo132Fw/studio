@echo off

set DOT_STUDIO=%UserProfile%\.studio
set LOCAL_LUNIITHEQUE=%UserProfile%\AppData\Roaming\Luniitheque

:: Make sure the .studio subdirectories exist
if not exist %DOT_STUDIO%\db\* mkdir %DOT_STUDIO%\db
if not exist %DOT_STUDIO%\lib\* mkdir %DOT_STUDIO%\lib
if not exist %DOT_STUDIO%\library\* mkdir %DOT_STUDIO%\library

:: Copy Luniistore JARs if needed
if not exist %DOT_STUDIO%\lib\lunii-java-util.jar copy %LOCAL_LUNIITHEQUE%\lib\lunii-java-util.jar %DOT_STUDIO%\lib\
if not exist %DOT_STUDIO%\lib\lunii-device-gateway.jar copy %LOCAL_LUNIITHEQUE%\lib\lunii-device-gateway.jar %DOT_STUDIO%\lib\
if not exist %DOT_STUDIO%\lib\lunii-device-wrapper.jar copy %LOCAL_LUNIITHEQUE%\lib\lunii-device-wrapper.jar %DOT_STUDIO%\lib\

java -cp ${project.build.finalName}.jar;lib/*;%DOT_STUDIO%/lib/*;. io.vertx.core.Launcher run ${vertx.main.verticle}
