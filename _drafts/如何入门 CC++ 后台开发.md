## 如何入门 C/C++ 后台开发

### 一、 C/C ++ 语言常用语法

> 精通 C/C++ 语法没什么实际用途。



#### 类（Big Three）

```c++
析构函数/拷贝构造函数/赋值运算符
多态是如何实现的？虚表
函数指针
typedef void (*func)(int, int);
func f;
struct ST
{
    int a: 4;
    int a: 3;   
}
款宽字符如何定义：
wchar_t ch = L"A";
wchar_t* pch = L"hellp";
//有安全隐患的
char* p = "中国人";
```



#### C++ 11/14 常用语法

```c++
1. 统一的初始化语法
class A
{
public:
	A(): sz{0}
	{
        memset/bzero
	}
private:
   int a{1}; 
   char sz[4];
}
2. auto/decltype
int i = 0;
auto j = i;
std::map<int, std::string> m;
std::map<int, std::string>::iterator iter = m.begin();
auto iter = m.begin();
3. for-each
for(; iter != m.end(); ++iter)
{
    //iter 
    iter->first;
}

for (const auto& iter : m)
{
    iter.first;
}

4. 右值引用 => 移动构造函数/std::move/std::forward/emplace_back
int a = 3;
int&& r = 3;
A(int i, int j);
push_back(a);
emplace_back()

5. default/final/override/delete;
class A final
{
    public:
    A() = default;
    
    public:
    void f() override;
    
}

6. std::array

7. std::thread

8. 线程同步 std::mutex/std::condition_variable/std::lock_guard

9. std::shared_ptr/unique_ptr/weak_ptr/std::enable_from_this

10. std::bind/std::function

11. std::chrono

12. lamda 表达式
```

```
filezilla 的源码： https://svn.filezilla-project.org/svn/FileZilla3/trunk
```





#### 熟悉一种开发工具（开发-编译-调试）

VS

Linux 了解一下makefile规则，cmake



### 二、熟悉一个或多个操作系统平台提供的 API 接口

- 文件IO（目录）
- 线程
- 进程
- 线程同步
- 时间函数

fwrite

chmod 

> 操作系统的 API 一般在长期内都不会发生变化，一旦习成，终生受用。

localtime



### 三、socket 网络编程

> telnet ip port

> socket/listen/bind/accept/recv/send/shutdown/close/select/connect

> IO Multiplexing: select poll epoll IOCP
>
> 网络通信模型：问答模式 一个客户端一个线程 多个客户端多个线程

**学习方法**：

1. 学习上面介绍的；
2. 看一到两个开源项目的网络通信部分（redis）



### 四、 数据库基本原理

> 数据库操作命令： 增删改查
>
> 索引的用法
>
> SQL 优化
>
> explain



### 五、其他

```c
算法数据结构
操作系统原理 PE/ELF/进程地址空间的内存/函数调用
个人习惯的养成
```









