#!/bin/bash
#函数返回值两种方式

#1给全局变量赋值
g_result=""  
  
function testFunc()  
{  
    g_result='local value'  
}  
  
testFunc  
echo $g_result  

#2把shell函数作为子程序调用，将其结果写到子程序的标准输出
function testFunc()  
{  
    local_result='local value'  
    echo $local_result  
}  
  
result=$(testFunc)  
echo $result  