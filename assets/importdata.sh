echo "デモデータのインポートプロセスを開始します。完了までに少々お時間がかかる場合があります。"
echo ""
echo "ステップ 1: Salesforce組織へログインします。完了したらブラウザウィンドウを閉じて下さい。"

force login

echo "ステップ 2: Force CLIツールを使ったデータのインポートプロセスを開始します。"
echo ""

force apex < data_opinion.data

echo ""
echo "インポートプロセスが完了しました。"