管道是实现“将前面的标准输出作为后面的标准输入”
xargs是实现“将标准输入作为命令的参数”
你可以试试运行：
代码:
echo "--help"|cat
echo "--help"|xargs cat

管道符后不加xargs相当于先将xargs后面的命令回车执行一下再从键盘里输入
管道符前面命令执行的结果内容
加上xargs 相当于直接从键盘输入管道符前面命令执行的结果内容再回车