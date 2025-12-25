@echo off
REM --------------------------------------------------
REM Streamlitアプリ自動起動＆必要ライブラリインストール
REM 黒画面最小化・文字化け防止対応
REM --------------------------------------------------

REM Python実行パス（必要に応じて変更）
set PYTHON_PATH=python\python.exe

REM 必要なライブラリ
set LIBS=streamlit pandas numpy plotly scipy

echo ==== 必要なライブラリをチェック＆インストール ====
%PYTHON_PATH% -m pip install --upgrade pip

for %%L in (%LIBS%) do (
    echo インストールチェック: %%L
    %PYTHON_PATH% -m pip install %%L
)

REM --------------------------------------------------
REM Streamlitアプリ起動（最小化）
REM --------------------------------------------------
REM chcp 65001 でUTF-8に変更、start /min で最小化起動
start /min cmd /c "chcp 65001 >nul && %PYTHON_PATH% -m streamlit run person_app3.py"

echo ==== Streamlitアプリ起動中 ====
exit
