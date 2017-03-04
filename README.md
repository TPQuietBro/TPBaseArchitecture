# TPBaseArchitecture


一.文件层次划分

1. Einwin
->  存放一应app都会涉及到的通用功能,例如网络请求库,基本配置,基本方法扩展,基础库,公用方法
2. ZNFoundation
->  存放一应智能的基础配置信息,包括自己对于Einwin库中方法的封装,三方SDK的引用等

3. YYZN
->  存放一应智能的业务逻辑线,不包含配置信息


注释: 公用头文件尽量放入YYZN.pch文件中

# TPBaseArchitecture
