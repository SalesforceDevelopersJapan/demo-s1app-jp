# Salesforce1 サンプルアプリ セットアップ #

<a name="setup-and-configuration" />
## セットアップとコンフィグレーション ##

以下のステップを行う事で、Dreamforce 13 developer keynoteのSalesforce1デモアプリケーションの環境を構築できます。

#### ステップ 1: Developer Edition 組織のセットアップ ####

もしあなたがまだSalesforce Developer Networkのメンバー出ない場合は, [http://developer.force.com/join](http://developer.force.com/join) に行き、手順に従ってDeveloper Edition組織のアカウントをサインアップして下さい。既にEnterprise EditionやUnlimited Edition、Performance Editionといった本番利用のアカウントをお持ちの場合でも、Developer Editionは開発、ステージング、既存の組織のデータを汚さずにサンプルデータを利用したテスト等に利用する事が可能です。特にデータを追加、更新、削除を行う様なアプリケーションの場合には非常に有効です。

すでにDeveloper Edition組織を持っている場合は、アカウントが“API の有効化” 権限を保持している事を確認します。この権限はデフォルトで有効となっておりますが、変更がなされていないかを確認します。より詳細な情報については、Salesforceのユーザインタフェースよりヘルプを参考にして下さい。

#### Step 2: Force CLI ツールをセットアップする ####

Force command-line interface (CLI) ツールをダウンロードします。既にコンパイル済みのバイナリファイルを以下よりダウンロード可能です:

* Linux: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/linux-amd64/force)
* OS X: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-386/force) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/darwin-amd64/force)
* Windows: [32-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-386/force.exe) | [64-bit](https://godist.herokuapp.com/projects/heroku/force/releases/current/windows-amd64/force.exe)

もしくは、リポジトリからclone/forkして実行可能ファイルを自身でビルドする事も可能です。より詳細な情報については以下をご覧下さい。
[A Command-line Interface for Force.com](http://www.wadewegner.com/2013/11/a-command-line-interface-for-forcecom/).

実行可能バイナリを手に入れたら、コマンドラインから実行出来るようにパスを通します。例えば、 ~/bin フォルダをforceコマンド用に作成します。そして、以下の様なコマンドでbinフォルダにパスを通します。(もしくは .bash_profile を更新します):

````bash
export PATH=~/bin:$PATH
````

またforceのバイナリを実行可能とするようにパーミッションを変更する必要があります。これを行うには、以下のコマンドを実行します:

````bash
chmod 755 force
````

#### ステップ 3: リポジトリのClone ####

このリポジトリをCloneします。

````bash
git clone https://github.com/DeveloperForceJapan/demo-s1app-jp.git
````

#### ステップ 4: Developer Edition組織にスキーマをインポートする ####

````bash
cd demo-s1app-jp
cd assets
chmod 755 *.sh
. importschema.sh
````

デモのアプリケーション、レイアウトそしてオブジェクトが組織に生成されます。

#### ステップ 5: Developer Edition組織にデータをインポートする ####

````bash
cd demo-df13-devkeynote-s1app
cd assets
. importdata.sh
````

#### ステップ 6: 組織のChatterおよびパブリッシャーアクションを有効化する ####

このデモアプリケーションではChatterおよびパブリッシャーアクションを利用します。そこでこれらの機能をお使いのDeveloper Edition (DE) 組織で有効かする必要があります。

1. Salesforceへログインします: [https://login.salesforce.com/](https://login.salesforce.com) より 先ほど[セットアップ]()を行った同一Developer Edition組織へログインします。

2. **設定** | **ビルド** | **カスタマイズ** | **Chatter** | **設定** を選択します。

3. **編集** ボタンより **有効** をチェックします。

4. **パブリッシャーアクション** の下の **パブリッシャーアクションを有効化** にチェックを入れ **保存** をクリックします。

5. **設定** | **ビルド** | **カスタマイズ** | **Chatter** | **フィード追跡** を選択します。

6. **意識調査**、**意識調査質問** そして **意識調査回答** を選択し、 **フィード追跡の有効化**にチェックを入れ、 **保存** をクリックします。

これで、カスタムオブジェクト上のChatter 及びパブリッシャーアクションがあなたの組織で有効になりました。

[デモアプリケーションの開発](https://github.com/developerforce/demo-df13-devkeynote-s1app/blob/master/DEMO.md)の準備が整いました。 

