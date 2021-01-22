目前的方案：

指令：不管是否过cache，地址永远四字节对齐，所以发出的size永远是010（即4字节），且因为只有读数据不涉及strb的问题

数据：

cpu向cache_soc发出的请求是地址不对齐的，cpu向cache_soc发出的size来指示几个字节

读数据：

​				过cache时，从cache发出的axi请求（实际上是发往mem_read的请求）中地址是对齐的，size是010

​				不过cache时，**axi请求的地址4字节不对齐，size表明读几个字节**

写数据：

​				过cache时，从cache发出的axi请求（实际上是发往mem_write的请求）中地址是对齐的，strb是1111，size是010（4字节）

​				不过cache时，**axi请求的地址4字节不对齐，size是根据不同指令不同，sb是000，sh是001，strb是以地址的低两位置零开始算起，哪个字节写，该位的strb是1**

有一个问题：

**读写数据时，如果不是整字读写，经过dcache和不经过dcache的处理方式不同**

比如sb 0001，即向四字节中从低到高第二个字节（0010）写一个字节数据ac，那么如果经过dcache，cpu向cache_soc传的数据应该是xxxxacxx（4字节），而不经过dcache应该怎么样呢？

如果axi满足以下描述，则这样处理是对的：

即使araddr/awaddr不是4字节对齐，传输时也要满足4字节，也就是说比如：

写时地址（awaddr）是001，awsize是000，strb是0010，那么写入的字节对应地址就是001；

读时地址（araddr）是001，arsize是000，在内存里001字节存储的数据是ac，那么axi发回来的数据是xxxxacxx

