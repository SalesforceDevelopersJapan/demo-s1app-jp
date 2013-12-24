# Salesforce1 サンプルアプリケーション #

<a name="overview" />
## オーバービュー ##

このデモアプリケーションでは、**意識調査**というカスタムアプリケーションを利用します。 **意識調査** では、顧客に提示した質問についての回答をトラックングする事が可能です。このアプリケーションを利用して、Salesforce1アプリケーションの機能について学んでいきます。

<a name="technologies" />
### キーとなるテクノロジー ###

以下のテクノロジーをこのデモアプリケーションでは使用しています:

- Force Command-line Interface (CLI)
- レポートタイプ & レポート
- Salesforce1 アプリケーション
- モバイルカード
- パブリッシャーアクション (クイックアクション)
- コンパクトビュー

<a name="sections" />
### セクション ###

このデモアプリケーションは5つのセクションに分かれています:

- [セクション 1: レポートタイプとレポートの作成](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section1)
- [セクション 2: Visualforceページおよびチャートを分析APIを利用して作成](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section2)
- [セクション 3: モバイルカードをSalesforce1 アプリケーションに追加](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section3)
- [セクション 4: クイックアクションをSalesforce1アプリケーションへ追加](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section4)
- [セクション 5: 意識調査質問のコンパクトレイアウトを作成](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section5)

基本的には [セクション 1](https://github.com/DeveloperForceJapan/demo-s1app-jp/blob/master/DEMO.md#section1) から順番に行っていく事をお勧めします。

<a name="demo" />
## デモアプリケーションの作成 ##

<a name="section1" />
#### セクション 1: レポートタイプとレポートの作成 ####

このデモアプリケーションではSalesforce1アプリケーション内でレポートを利用します。カスタムレポートを作成するにあたり、その前にカスタムレポートタイプを作成する必要があります。

ここでは意識調査の質問に対する回答のレポートを作成します。

##### カスタムレポートタイプの作成 #####

新しいカスタムレポートタイプを作成します。

1. **設定** | **作成** | **レポートタイプ**をクリックします。 もし解説ページが現れた場合は **続ける**をクリックします。

2. **新規カスタムレポートタイプ** をクリックします。

3. **主オブジェクト** に **意識調査質問回答** を選択します。

4. **レポートタイプの表示ラベル** に **意識調査質問回答**. The **レポートタイプ名** には **Opinion_Question_Answers** と入力します。

5. **説明** には **意識調査質問回答のカスタムレポートタイプ** と入力します。

6. **カテゴリに格納** で **その他レポート** を選択します。

7. **リリース状況** では **リリース済み** を選択します。

8. **次へ** をクリックします。

9. **保存** をクリックします。

##### カスタムレポートの作成 #####

1. **ホーム** や **意識調査**の並ぶメニューバー上にある **+** ボタンをクリックします。

2. **レポート** をクリックします。

3. **新規レポート** をクリックします。

4. **その他レポート** を展開し、 **意識調査質問回答** を選択肢し **作成** をクリックします。

5. レポートを **表 形式** から **マトリックス 形式** へ変更します。

6. **意識調査質問: 意識調査質問番号** を **行のグルーピングを作成するには、ここに項目をドロップします。** の箇所にDrag & Dropします。

7. **回答** を **列のグルーピングを作成するには、ここに項目をドロップします。** の箇所にDrag & Dropします。

8. **保存** をクリックします。

9. レポート名を **回答** とし、 **レポートの一意の名前** を **Answers** にします。

10. **レポートを保存して実行** をクリックします。

11. **レポートのId**を確認します。これはブラウザのURLから確認できます。以下の用に取得して下さい。

	![capturereportid](https://f.cloud.github.com/assets/746259/1708947/b2269cce-6116-11e3-92a2-5d3000de90b6.png)

これで必要なレポートタイプおよびレポートの作成が完了しました。

<a name="section2" />
#### セクション 2: Visualforceページおよびチャートを分析APIを利用して作成 ####

##### Visualforce コンポーネントの作成 #####

新しくVisualforceコンポーネントを作成します

1. **設定** | **開発** | **コンポーネント** をクリックします。

2. **新規** をクリックします。

3. **表示ラベル** には **意識調査パイチャート** と入力し **名前** には **OpinionChartPie** と入力します。

4. 以下のコードを **Visualforce Markup** タブに入力します。このコードは **src** フォルダ内の **OpinionChartPie.component** ファイルからも見つける事が可能です。

	**注意**: **YOURREPORTID** の部分を任意の意識調査質問のオブジェクトのIDで書き換えて下さい。IDの取得方法はレポートのサイト同様に、データを表示した際のURL部分から18桁のIDを取得します。

	````html
	<apex:component >
		<apex:attribute name="reportId" description="ReportId" type="String" id="reportId"/>
		<apex:attribute name="questionName" description="Question Name" type="String" id="questionName"/>
	    <apex:includeScript value="//code.jquery.com/jquery.js"/>
	    <!--
		<apex:includeScript value="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" />
	    -->
	    <apex:includeScript value="//cdnjs.cloudflare.com/ajax/libs/d3/3.3.9/d3.min.js" />
	    <apex:includeScript value="//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.13-beta/nv.d3.min.js"/>
	    
	    <apex:stylesheet value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
	    <apex:stylesheet value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"/>
	    <apex:includeScript value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"/>

	    <script>
	     var myChart;
	     var chart;
	     var that = {}
	 $(document).ready(function(){
		
	    $.ajax('/services/data/v29.0/analytics/reports/{!reportId}',
	        {
	            type: "POST",
	            data:{
				    "reportMetadata": {
		        	    "reportFilters": [
	    	        	{
	        	        	"value": "{!questionName}",
		            	    "operator": "equal",
	    	            	"column": "072E0000002ec1f"
	        	    	}]
	                }
	            },
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader('Authorization', 'Bearer {!$Api.Session_ID}');
	            },
	            success: function(response) {
	                /* Format the data */
	                that.simpleData = []
	                $.each(response.groupingsDown.groupings, function(di, de) {
	                    $.each(response.groupingsAcross.groupings, function(ai, ae) {
	                        that.simpleData.push({"key": ae.label, "y": response.factMap[de.key+"!"+ae.key].aggregates[0].value});
	                    });
	                });

	                /* Chart */
	                 mychart = nv.addGraph(function() {
	                     var windowBox = getWindowBox();
	                    var width = windowBox.width,
	                	    height = windowBox.height;
	                
	                    chart = nv.models.pieChart()
	                        .x(function(d) { return d.key })
	                        .y(function(d) { return d.y })
	                        .color(d3.scale.category10().range())
	                        .width(width)
	                        .height(height);
	               
	                    d3.select("#chart1")
	                        .datum(that.simpleData)
	                        .transition()
	                        .duration(1200)
	                        .attr('width', width)
	                        .attr('height', height)
							.attr("viewBox", "0, 0, " + width + ", " + height)
							.attr("preserveAspectRatio", "xMinYMin")
	                        .call(chart);
	                
	                    chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
	                    nv.utils.windowResize(chart.update);
	                    return chart;
	                });
	            }
	        }
	    );
	});

		function getWindowBox(){
	        var w = window,
	        d = document,
	        e = d.documentElement,
	        g = d.getElementById('chart'),
	        x = w.innerWidth || e.clientWidth || g.clientWidth,
	        y = w.innerHeight|| e.clientHeight|| g.clientHeight;
	        x = w.innerWidth || e.clientWidth || g.clientWidth;
	        y = w.innerHeight|| e.clientHeight|| g.clientHeight;
	        return { width:x, height:y };
	    }
		function updateWindow() {
	        var box = getWindowBox();
	        $("#chart1").attr("width", box.width).attr("height", box.height);
	    }
	    window.onresize = updateWindow;
	    
	        
	</script>
	<div class="row">
	    <svg id="chart1"></svg>
	</div>
	</apex:component>
	````

5. **保存** をクリックします。

##### Visualforceページの作成 #####

新しくVisualforceページを作成します。

1. **設定** | **開発** | **ページ** をクリックします。

2.  **新規** をクリックします。

3. **表示ラベル** に **意識調査パイチャート** と入力し **名前** に **OpinionChartPie** と入力します。

4. **Salesforce モバイルアプリケーションでの使用が可能** にチェックを入れます。

5. 以下のコードを **Visualforce Markup** タブに入力します。このコードは **src** フォルダ内の **OpinionChartPie.page** ファイルからも見つける事が可能です。

	**注意**: **YOURREPORTID** の部分を前のセクションで取得したレポートのIDで書き換えて下さい

	````html
	<apex:page cache="false"
	    standardController="Opinion_Question__c"
	    standardStylesheets="false"
	    showHeader="false"
	    sidebar="false">
	        
	  <meta name="viewport" content="width=device-width"/>
	  <c:OpinionChartPie questionName="{!Opinion_Question__c.Name}" reportId="YOURREPORTID">
	  </c:OpinionChartPie>

	</apex:page>
	`````

6. **保存** をクリックします。

7. **プレビュー** をクリックし、レポートが正しく表示されるかを確認します。以下の様なレポートが表示されるはずです:

	![Opinion Pie Chart Preview](https://f.cloud.github.com/assets/746259/1708981/655d14bc-6117-11e3-8f7b-c0915ac8362a.png)

これでVisualforceコンポーネントおよびページの作成が完了しました。

<a name="section3" />
#### セクション 3: モバイルカードをSalesforce1 アプリケーションに追加 ####

意識調査質問のページレイアウトにモバイルカードを追加してみましょう

1. **意識調査質問** のページレイアウトを **設定** | **作成** | **オブジェクト** から選択します。

2. **意識調査質問** をリストから選択します。

3. **ページレイアウト** セクションで **意識調査質問レイアウト** の横の **編集** をクリックします。

4. **Visualforce ページ** を **意識調査質問レイアウト** 選択し、 **意識調査パイチャート** を **モバイルカード (Salesforce1 のみ)** セクションへDrag & Dropします。

	![Opinion Pie Chart in the Mobile Cards](https://f.cloud.github.com/assets/746259/1709006/c469da3a-6117-11e3-9191-a0f5db4c5b25.png)

5. **保存** をクリックします。

実際に試してみましょう。

1. 新しいタブを開き、以下のURLを入力し、Salesforce1 Webクライアントへアクセスします: [https://ap.salesforce.com/one/one.app](https://ap.salesforce.com/) 

	**注意**: このクライアントはモバイル画面にあわせてデザインされています。ブラウザウィンドウをモバイル画面のサイズに調整することで、実際のモバイル画面近い挙動を得られます。または、モバイルシュミレータ/エミュレータをからログイン、もしくはApple StoreやGoogle Playからアプリケーションをダウンロードすることも可能です。

2. 左上のメニューを開き **表示件数を増やす** をタップし、 **意識調査** アプリケーションを選択します。

3. **OP-0000** の意識調査を選択します。

4. 右側にスワイプ (もしくは右側のドットをクリック) し、**意識調査質問** をクリックします。

5. **OQ-0000** の質問を選択します。

6. 右側へスワイプ (もしくは右側のドットをクリック)します。グラフがページ上に表示されています。

	![Chart in Mobile Client](https://f.cloud.github.com/assets/746259/1709024/1df57d66-6118-11e3-8d41-cc042a8b7d48.png)

追加の項目を質問ページに追加してみましょう。

1. **意識調査質問レイアウト** より**拡張ルックアップ** を選択します。

2. **意識調査** を先ほど追加した **意識調査パイチャート** の下へDrag & Dropします、**保存** をクリックします。

	![Adding the Opinion under the Opinion Chart Page](https://f.cloud.github.com/assets/746259/1709061/7aa6f2ba-6118-11e3-85ba-4643af06af9c.png)


3. Salesforce1モバイルアプリケーションにもどります。ページをリフレッシュし、元のチャートのページの戻ります。すると**意識調査質問** の情報がチャートの下に表示されているでしょう。

	![Opinion Chart with Opinion Question](https://f.cloud.github.com/assets/746259/1709078/bd5ce272-6118-11e3-8473-9c88f9d0281f.png)

おめでとうございます。モバイルカードをSalesforce1アプリケーションへ追加する事に成功しました。

<a name="section4" />
#### セクション 4: クイックアクションをSalesforce1アプリケーションへ追加 ####

1. **設定** | **作成** | **オブジェクト** をクリックします。

2. **意識調査質問** をリストから選択します。

3. **ボタン、リンク、およびアクション** セクションより**新規アクション**をクリックします。

4. **レコードを更新** を **アクション種別** に選択します。

5. **表示ラベル** に **質問の無効化** と入力し、 **名前** に **Deactivate_Question** と入力します。

6. **保存** をクリックします。

7. **意識調査質問 項目** より**質問の無効化** をページへ Drag & Dropします。

	![Deactivation Reason](https://f.cloud.github.com/assets/746259/1709108/1faddd3c-6119-11e3-8b60-c84cbd7821fc.png)

8. **保存** をクリックします。

9. **定義済み項目値** の **新規** をクリックします。

10. **有効** を **項目名** から選択します。

11. **新規項目値の指定** の数式エディタへ "False" (ダブルクォートは無し) を入力しします。

12. **保存** をクリックします。

13. **意識調査質問** オブジェクトまで戻り、**ページレイアウト** セクションから **意識調査質問レイアウト** の横にある **編集** をクリックします。

14. **パブリッシャーアクション** にある　**グローバルパブリッシャーレイアウトを上書き** をクリックします。

15. **意識調査質問レイアウト** の下にある **アクション** を選択します。

16. **質問の無効化** を **パブリッシャーアクション** リストの先頭に Drag & Dropします。

	**注意**: **パブリッシャーアクション** のセクションには通常グローバルパブリッシャーレイアウトで定義された項目が並びますが、これを上書きする事が可能で、 **グローバルパブリッシャーレイアウトを上書き** のリンクをクリックします。

	![Deactivation Reason in Pulisher Actions list](https://f.cloud.github.com/assets/746259/1709130/6b5eb4ae-6119-11e3-92ec-b71f250bb264.png)

17. **保存** をクリックします。

実際に試してみましょう。!

1. モバイルアプリケーションに戻ります。アプリケーションをリフレッシュする事を忘れないで下さい。

2. 左上のメニューを開き、 **表示件数を増やす** から **意識調査** アプリケーションをクリックします。

3. **OP-0000** の意識調査を選択します。

4. 右へスワイプ (もしくは右のドットをクリック) し、**意識調査質問**をクリックします。

5. **OQ-0001** の質問をクリックします。

6. スクリーン右下角にある、青いボックスに+マークの入った **クイックアクション** ボタンをクリックします。

	![deactivatequestionactionlist](https://f.cloud.github.com/assets/746259/1709135/9ad5657a-6119-11e3-8631-a7ccd4958d9f.png)

7. **質問の無効化**をクリックします。

8. **会社からの削除命令** を **無効化の理由** リストより選択します。

	![Select Deactivation Reason](https://f.cloud.github.com/assets/746259/1709147/c070bdd4-6119-11e3-8917-9f08b9003f41.png)

9. **送信** をクリックします。

<a name="section5" />
#### セクション 5: 意識調査質問のコンパクトレイアウトを作成 ####

1. **設定** | **作成** | **オブジェクト** をクリックします。

2. **意識調査質問** をリストより選択します。

3. **コンパクトレイアウト** から **新規** をクリックします。

4. **表示ラベル** に **カスタムコンパクトレイアウト** と入力し、**名前** に **Custom Compact Layout** と入力します。

5. 以下のフィールドを選択して並べます: **意識調査質問番号**, **質問**, **有効**, **無効化の理由**

6. **保存** をクリックします。

7. **コンパクトレイアウトの割当** をクリックし、 **割り当ての編集**をクリックします。**カスタムコンパクトレイアウト** をリストより選択し **保存** をクリックします。

8. モバイルアプリケーションで **意識調査質問** ページへ戻り、ページをリフレッシュします。

	**注意**: Salesforceはページを積極的にキャッシュします。もし新しいビューが表示されない場合は、ブラウザの履歴を消去するか、もしくはブラウザ/エミュレータを一旦閉じて見て下さい。

9. ページがコンパクトレイアウトによって設定したレイアウトで表示されている事を確認します。

おめでとうございます! これでこのサンプルアプリケーションの作成が完了しました！！
