# AYTableViewAnimationKit
TabelVeiw动画操作，只需一行代码就可实现。

调用步骤：
1.导入 AYRefeashKit

2.在需要的地方直接加入头文件 UITableView+AYAnimationKit.h

3.在刷新TableView的地方调用:

    [self.tableView reloadData];
	
    //分类实现tabelView动画
    [self.tableView ayShowAnimationWithType:TypeEnum];


[AFCompatibilityMacros.h missing from podspec · Issue #4202 · AFNetworking/AFNetworking](https://github.com/AFNetworking/AFNetworking/issues/4202)
同时也感谢www.diycode.cc/topics/955这位博主。
