#SDK_PATH、TARGET需要根据当前的编译环境来定义
SDK_PATH=/Applications/Xcode13.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
LANGUAGE=objective-c
TAREGT=x86_64-apple-macos11.6

TEST_NAME=test
LIBRARY_NAME=TestExample
HEAD_PATH=./StaticLibrary
LIBRARY_PATH=./StaticLibrary

echo "---步骤1：进入StaticLibrary"
pushd ./StaticLibrary

echo "---步骤2：生成静态库目标文件"
clang \
-x $LANGUAGE \
-target $TAREGT \
-fobjc-arc \
-isysroot $SDK_PATH \
-c ${LIBRARY_NAME}.m -o ${LIBRARY_NAME}.o

echo "---步骤3：封装静态库文件"
#这里没有手动改名，而是使用了ar命令封装静态库
ar -rc lib${LIBRARY_NAME}.a ${LIBRARY_NAME}.o

echo "---步骤4：退出StaticLibrary"
popd

echo "---步骤5：生成目标文件"
clang \
-x $LANGUAGE \
-target $TAREGT \
-fobjc-arc \
-isysroot $SDK_PATH \
-I ${HEAD_PATH} \
-c ${TEST_NAME}.m -o ${TEST_NAME}.o

echo "---步骤6：生成可执行文件"
clang \
-target $TAREGT \
-fobjc-arc \
-isysroot $SDK_PATH \
-Xlinker -all_load \
-L${LIBRARY_PATH} \
-l${LIBRARY_NAME} \
${TEST_NAME}.o -o ${TEST_NAME}


#echo "---步骤7：查看test.o符号表"
#objdump --macho -d ${TEST_NAME}

