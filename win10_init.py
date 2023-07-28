import os
import shutil

file_path = "Tencent.wsb"
relative_dir_identifier = ".\\"

try:
    with open(file_path, "r", encoding="utf-8") as file:
        file_content = file.read()
except FileNotFoundError:
    print(f"文件 '{file_path}' 未找到。")
except IOError:
    print(f"无法打开文件 '{file_path}'。")

relative_dir = os.path.dirname(os.path.abspath(__file__)) + "\\"
print ("获取到的相对路径: " + relative_dir)

# replace relative dir
wsb_template = file_content.replace(relative_dir_identifier, relative_dir)

# backup old wsb by copying
shutil.copyfile("Tencent.wsb", "Tencent.wsb.bak")
print("备份原有wsb文件为Tencent.wsb.bak")

# generate new wsb in utf-8
with open("Tencent.wsb", "w", encoding="utf-8") as file:
    file.write(wsb_template)
    print("生成新的wsb文件")
