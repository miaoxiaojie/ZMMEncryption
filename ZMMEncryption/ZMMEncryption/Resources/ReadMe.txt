 加密的几种方式
1.对称加密
1）加密和解密的秘钥相同
2）运算速度快，加密强度高，适合大批量的数据，数据加较长的
AES
2.非对称加密
1）加密和解密秘钥不同，一个是公钥一个是私钥
2）加密时间长，适用于数字签名，传输加密数据安全性高于对称加密
3）不适合数量较大的情况
4）RSA
3.base64加密
1）可以将任意的二进制数据进行Base64编码
2）编码后的数据比编码前的数据会大1/3左右
4.MD5加密
1）消息 - 摘要算法5
2）压缩性： 任意长度的数据，算出MD5值得长度国定
3）抗修改性：对原数据践行任何改动，哪怕只修改一个字节所得MD5值很大区别
4）压缩到国定长度128bit，长度小适合互联网传输
5）相同文件多次压缩的值不变，常用于对文件的是否被篡改的校验
6）md5算法比同类的sha计算速度快
5.SHA加密
1）哈希算法主要适用于数字签名标准里面定义的数字签名算法。
