在读 C++ 语言导学的时候产生的一些问题，实际上有些问题有些在 C++ Primer 中都有，但是 C++ Primer 5th 太厚了忘得快差不多了，所以先记下来，
毕竟读这本书是为了快速把 C++ 捡起来，做一些小的 Demo (sylar-yin)以及上 Games101

### 抽象类中的析构函数为啥要定义成虚函数
对于抽象类来说，因为其派生类对象通常是通过抽象基类的接口操纵的，所以基类中必须有一个虚析构函数。
特别是，我们可能使用一个基类指针释放派生类对象，这样虚函数调用能够确保我们调用正确的析构函数，然后该析构函数再隐式调用其基类的析构函数及其成员的析构函数。

### placement new
起因：拷贝构造函数和拷贝赋值函数写起来太麻烦，有很多地方是重复的

```cpp
Vector(Vector const &other) {
    m_size = other.m_size;
    m_data = (int *)malloc(m_size * sizeof(int));
    memcpy(m_data, other.m_data, m_size * sizeof(int));
}
// 正常的写法，太麻烦了，但是性能很高，因为直接在原有内存上重新申请了内存
Vector &operator=(Vector const &other) {
    m_size = other.m_size;
    m_data = (int *)realloc(m_data, m_size * sizeof(int));
    memcpy(m_data, other.m_data, m_size * sizeof(int));
    return *this;
}
// 这样方便，但是先析构在构造，性能不高
Vector &operator=(Vector const &other) {
    this->~Vector();        // 先销毁现有的
    new (this)Vector(other) // 在重新构造(placement new)
    return *this;
}
```

### 为什么要区分移动和拷贝
有时候我们需要把对象从 v2 移动到 v1 ，而不需要设计实际数据的拷贝
时间复杂度：移动是 O(1)，拷贝是 O(n)
#### 那些情况会触发"移动”
```cpp
return v2; // v2 作为返回值，此时 v2 马上要离开函数的作用域，接下来不会再使用，所以可以 move
v1 = std::vector<int>(200); // 就地构造 v2，等号右边的 vector 不会被使用没必要调用拷贝构造;
```

### 为什么不定义移动构造函数是低效的
默认移动构造函数 = 先调用拷贝构造函数，然后调用析构函数析构 others，然后再调用默认构造函数构造 others

### 构造函数总结

```cpp
C c1 = c2;               // 拷贝构造函数
C c1 = std::move(c2);    // 移动构造函数
c1 = c2;                 // 拷贝赋值函数
c1 = std::move(c2);      // 移动赋值函数
C c1 = C();              // 移动构造函数
c1 = C();                // 移动赋值函数
return c2;               // 移动赋值函数
```

### 为什么 unique_ptr 不能拷贝
因为 unique_ptr 删除了拷贝构造函数，那为什么要删除呢？
因为 unique_ptr 的析构函数式释放指针，如果可以拷贝就会导致重复释放的问题